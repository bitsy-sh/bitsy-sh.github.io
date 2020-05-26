
FROM golang:1.14-alpine AS build

# Optionally set HUGO_BUILD_TAGS to "extended" when building like so:
#   docker build --build-arg HUGO_BUILD_TAGS=extended .
ARG HUGO_BUILD_TAGS

ARG CGO=1
ENV CGO_ENABLED=${CGO}
ENV GOOS=linux
ENV GO111MODULE=on


# gcc/g++ are required to build SASS libraries for extended version
RUN apk update && \
    apk add --no-cache gcc g++ musl-dev git && \
    go get github.com/magefile/mage

RUN mkdir -p /go/src/github.com/gohugoio/ && \
    cd /go/src/github.com/gohugoio/ && git clone https://github.com/gohugoio/hugo.git

WORKDIR /go/src/github.com/gohugoio/hugo

RUN mage hugo && mage install

# ---

FROM alpine:3.11

COPY --from=build /go/bin/hugo /usr/bin/hugo

RUN apk update && \
    apk add --no-cache ca-certificates libc6-compat libstdc++ git

VOLUME /site
WORKDIR /site


RUN adduser \
    --disabled-password \
    --no-create-home \
    --uid "1000" \
    "hugzi"
USER hugzi

# Expose port for live server
EXPOSE 1313

CMD ["hugo"]
