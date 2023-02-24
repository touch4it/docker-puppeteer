# Docker Puppeteer

## Description

A Node + Puppeteer base image for running Puppeteer scripts. Add your own tools (such as Jest, Mocha, etc), link services you want to test via Docker Compose, and run your Puppeteer scripts with a headless Chromium.

## Versions

See the list of [Docker Hub tags](https://hub.docker.com/r/touch4it/puppeteer/tags/) for Puppeteer versions available.

## Build

```sh
docker buildx build --platform=linux/amd64 .
```

## Usage

To use the docker image directly, run:

```sh
docker run -i --init --cap-add=SYS_ADMIN --rm touch4it/puppeteer:latest node -e "$(cat path/to/script.js)"
```

where path/to/script.js is the path relative to your working directory. Note the image requires the SYS_ADMIN capability since the browser runs in sandbox mode.

Further information: https://pptr.dev/guides/docker

## Example

See the [example directory](example) for a complete Docker Compose example, showing how to run Puppeteer against a linked Docker Compose web service.

## Releasing

1. Create a new release on GitHub. The image is tagged with the same version as Puppeteer.
2. Docker Hub automatically builds images for the tag.
3. There is no step 3.

## Origin

Forked from [BuildKite Puppeteer repository](https://github.com/buildkite/docker-puppeteer)

Updated Dockerfile from [official Puppeteer repository](https://github.com/puppeteer/puppeteer)
