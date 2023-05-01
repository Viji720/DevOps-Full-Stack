FROM golang:1.19-alpine

RUN apk update && apk add --no-cache git && apk add --no-cach bash && apk add build-base

RUN mkdir /app

WORKDIR /app

COPY . /app

RUN go get ./...

EXPOSE 8080

CMD DB_HOST=52.66.14.139 DB_USER=postgres DB_PASSWORD=password DB_NAME=mydb DB_PORT=5432 go run main.go
