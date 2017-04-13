FROM golang:alpine
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o whalesay .
ENTRYPOINT ["/app/whalesay"]

EXPOSE 80
