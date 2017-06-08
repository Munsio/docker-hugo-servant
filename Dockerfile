FROM alpine:3.5

RUN apk add --no-cache ca-certificates openssl git hugo tar

ENV SERVANT_RELEASE=v0.1.2

COPY ./app app/

# Consider revising: https://www.ctl.io/developers/blog/post/dockerfile-add-vs-copy/#which-to-use
ADD https://github.com/Munsio/servant/releases/download/${SERVANT_RELEASE}/linux-amd64.tar.gz /tmp

RUN mv /tmp/servant /usr/local/bin \
	&& chmod +x /app/entrypoint.sh \
    && chmod +x /usr/local/bin/servant

WORKDIR /app

CMD "servant"