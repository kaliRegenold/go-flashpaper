FROM golang:1.11 as builder
WORKDIR /go/src/flashpaper
RUN go get golang.org/x/net/context
COPY flashpaper.go .
RUN go build

FROM alpine:latest
WORKDIR /go/src/flashpaper
COPY --from=builder /go/src/flashpaper .
#RUN ./flashpaper
#CMD ["./flashpaper"]
CMD sh



#RUN wget https://dl.eff.org/certbot-auto -P /usr/local/sbin && \
#    chmod a+x /usr/local/sbin/certbot-auto

#RUN go get golang.org/x/net/context

#WORKDIR /go

#COPY . /go

#RUN go build
#RUN openssl req \
#    -new \
#    -newkey rsa:4096 \
#    -days 365 \
#    -nodes \
#    -x509 \
#    -subj "/C=US/ST=Denial/L=DockerLand/O=Dis/CN=www.flashpaper.com" \
#    -keyout /go/src/app/go-flashpaper/server.key \
#    -out /go/src/app/go-flashpaper/server.crt
#EXPOSE 8443
#ENTRYPOINT ["./go-flashpaper"] 
