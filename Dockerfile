FROM golang:alpine

ADD . /root/
WORKDIR /root
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o whalesay .

FROM alpine:latest
LABEL maintainer "Niko Virtala <niko@nikovirtala.io>"

WORKDIR /root/
COPY --from=0 /root/whalesay .
EXPOSE 80
ENTRYPOINT ["/root/whalesay"]

