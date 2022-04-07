FROM golang:alpine as build
RUN  apk update && apk add --no-cache git
WORKDIR /src
COPY . .
RUN go mod tidy
RUN go version
RUN go test ./... -cover
RUN go build -o sample-go-jenkins

FROM alpine
WORKDIR /app
COPY --from=build /src/sample-go-jenkins /app

ENTRYPOINT [ "/app/sample-go-jenkins" ]