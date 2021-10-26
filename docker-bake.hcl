// Special target: https://github.com/docker/metadata-action#bake-definition
target "docker-metadata-action" {
    platforms = [
        "linux/amd64",
        "linux/arm64",
    ]
}

target "alpine" {
    dockerfile = "Dockerfile"
    target = "alpine"
    tags = [
        "ghcr.io/cyb3r-jak3/docker-udpt:alpine",
        "cyb3rjak3/docker-udpt:alpine"
    ]
}

target "distroless" {
    dockerfile = "Dockerfile"
    target = "distroless"
    tags = [
        "ghcr.io/cyb3r-jak3/docker-udpt:distroless",
        "cyb3rjak3/docker-udpt:distroless"
    ]
}

target "distroless-release" {
    inherits = ["docker-metadata-action", "distroless"]
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
    inherits = ["docker-metadata-action", "alpine"]
    cache-to = [
        "type=registry,mode=max,ref=ghcr.io/cyb3r-jak3/docker-udpt-cache:alpine"
    ]
    cache-from = [
        "ghcr.io/cyb3r-jak3/docker-udpt-cache:alpine"
    ]
}