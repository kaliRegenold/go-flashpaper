FROM golang:1.11 as builder
WORKDIR /go/src/flashpaper
RUN go get golang.org/x/net/context
COPY flashpaper.go .
RUN go build

FROM ubuntu:16.04
WORKDIR /go/src/flashpaper
COPY --from=builder /go/src/flashpaper .
CMD bash
