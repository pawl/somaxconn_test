FROM python:3.6.1-alpine

WORKDIR /app

EXPOSE 80

COPY . /app
COPY ./conf/ /

RUN apk add --no-cache supervisor nginx

# temporary dependencies required for installing gevent
RUN apk --update add --virtual build-dependencies gcc musl-dev \
  && pip install -r requirements.txt \
  && apk del build-dependencies

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
