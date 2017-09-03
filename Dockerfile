FROM golang:alpine as build

WORKDIR /whalesay
ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o whalesay .

FROM gcr.io/distroless/base
LABEL maintainer "Niko Virtala <niko@nikovirtala.io>"

WORKDIR /
COPY --from=0 /whalesay .
EXPOSE 80
ENTRYPOINT ["/whalesay"]

