FROM rust:1.56.0-alpine as builder

RUN apk add --no-cache git musl-dev \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/naim94a/udpt.git && \
    cd udpt && \
    cargo build --release

FROM alpine:latest as alpine
ENV HTTP_PORT=1212

WORKDIR /udpt
COPY --from=builder /udpt/target/release/udpt-rs ./udpt-rs
EXPOSE ${HTTP_PORT}/udp
ENTRYPOINT [ "./udpt-rs", "-c", "/config.toml" ]


FROM gcr.io/distroless/static as distroless
ENV HTTP_PORT=1212

WORKDIR /udpt
COPY --from=builder /udpt/target/release/udpt-rs ./udpt-rs
EXPOSE ${HTTP_PORT}/udp
ENTRYPOINT [ "./udpt-rs", "-c", "/config.toml" ]