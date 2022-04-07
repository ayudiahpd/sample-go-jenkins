FROM golang:alpine as build
RUN  apk update && apk add --no-cache git
WORKDIR /src
COPY . .
RUN go mod tidy
RUN go build -o sample-go-jenkins
RUN go test -cover

FROM alpine
WORKDIR /app
COPY --from=build /src/sample-go-jenkins /app

ENTRYPOINT [ "/app/sample-go-jenkins" ]