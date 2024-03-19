FROM golang:latest

WORKDIR /app
COPY . .

RUN go build -o ./out/go-url-shortener ./cmd/webserver

CMD ["./out/go-url-shortener"]
