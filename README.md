# Docker-UDPT

Docker image for the [UDPT](https://github.com/naim94a/udpt) tracker. There are two images available `alpine` and `distroless`. Images are available vai both GitHub and Docker Hub.

#### Base Images

- `cyb3rjak3/udpt`
- `ghcr.io/cyb3r-jak3/udpt`

The `alpine` tag is based of the latest tag of the alpine images. The `distroless` tag is based of the latest tag of the [distroless project](https://github.com/GoogleContainerTools/distroless)

## Using

Both images use a config location of `/config.toml`

`docker run -d -v $PWD/config.toml -p 1212:1212/udp cyb3rjak3/udpt:distroless`
