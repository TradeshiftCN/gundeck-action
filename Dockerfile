FROM alpine:3.11.2 as builder

RUN echo "Building up image for project gundeck-action"

COPY . /gundeck-action

WORKDIR /gundeck-action

ENTRYPOINT echo "Hello world"
