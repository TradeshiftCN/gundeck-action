FROM alpine:3.11.2 as builder

RUN echo "Building up image for project template_project_name"

COPY . /template_project_name

WORKDIR /template_project_name

ENTRYPOINT echo "Hello world"
