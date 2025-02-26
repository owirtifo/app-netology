# syntax=docker/dockerfile:1

FROM alpine:3.18 as builder

ARG HUGO_VERSION=0.120.4
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz -C /usr/local/bin
ADD src/ /site
RUN hugo -s /site

FROM alpine:3.18
RUN apk add --no-cache nginx
COPY --from=builder /site/public /var/www/app

COPY default.conf /etc/nginx/http.d/default.conf

ENTRYPOINT [ "/usr/sbin/nginx" ]
CMD [ "-g", "daemon off;" ]
