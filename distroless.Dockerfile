FROM rust:1.55-alpine as builder

RUN apk add --no-cache git musl-dev \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/naim94a/udpt.git && \
    cd udpt && \
    cargo build --release

FROM gcr.io/distroless/static

WORKDIR /udpt
COPY --from=builder /udpt/target/release/udpt-rs ./udpt-rs
EXPOSE 1212/udp
ENTRYPOINT [ "./udpt-rs", "-c", "/config.toml" ]