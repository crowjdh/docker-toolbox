ARG BASE_IMAGE=alpine:3.4
FROM ${BASE_IMAGE}

RUN apk add --no-cache netcat-openbsd

ENTRYPOINT ["nc"]
