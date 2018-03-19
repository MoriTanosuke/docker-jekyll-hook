FROM nginx:alpine

RUN apk -U add build-base fcgiwrap git libffi-dev ruby ruby-bundler ruby-dev ruby-json zlib-dev \
 && rm -f /var/cache/apk/* \
 && mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled

COPY files/. /

VOLUME /source /site

ENTRYPOINT ["/entrypoint"]
CMD ["/startup"]
