# build stage
FROM golang AS build-env
ADD . /src
RUN cd /src && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o sendemailgo

# final stage
FROM alpine:3.19.1
COPY --from=build-env /src/sendemailgo /usr/local/bin/