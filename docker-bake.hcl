// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
        "linux/386",
        "linux/s390x"
    ]
}

target "alpine" {
    dockerfile = "alpine.Dockerfile"
    tags = [
        "ghcr.io/cyb3r-jak3/docker-udpt:alpine",
        "cyb3rjak3/docker-udpt:alpine"
    ]
}

target "distroless" {
    dockerfile = "distroless.Dockerfile"
    tags = [
        "ghcr.io/cyb3r-jak3/docker-udpt:distroless",
        "cyb3rjak3/docker-udpt:distroless"
    ]
}

target "distroless-release" {
    inherits = ["distroless", "docker-metadata-action"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/docker-udpt-cache:distroless"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/docker-udpt-cache:distroless"
    ]
    platforms = [
        "linux/amd64",
    ]
}
target "alpine-release" {
    inherits = ["alpine", "docker-metadata-action"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/docker-udpt-cache:alpine"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/docker-udpt-cache:alpine"
    ]
}