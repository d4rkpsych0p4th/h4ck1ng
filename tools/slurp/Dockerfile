FROM golang:1.15.2-alpine3.12

RUN apk add git build-base curl
COPY . /app
WORKDIR /app
RUN go build -o slurp main.go
ENV PATH="/app:${PATH}"

ENTRYPOINT []
