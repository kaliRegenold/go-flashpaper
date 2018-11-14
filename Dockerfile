FROM golang:1.11 as builder
WORKDIR /go/src/flashpaper
COPY flashpaper.go .
RUN go build

FROM golang:1.11
WORKDIR /go/src/flashpaper
COPY --from=builder /go/src/flashpaper .
RUN openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=US/ST=Denial/L=DockerLand/O=Dis/CN=localhost" \
    -keyout /go/src/flashpaper/server.key \
    -out /go/src/flashpaper/server.crt
EXPOSE 8443
ENTRYPOINT ["./flashpaper"]
