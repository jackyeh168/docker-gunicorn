FROM python:3.7-alpine as base
FROM base as builder
RUN mkdir /install && apk add --no-cache --virtual .build-deps build-base
WORKDIR /install
RUN pip install --install-option="--prefix=/install" gunicorn gevent

FROM base
COPY --from=builder /install /usr/local
COPY . /app
WORKDIR /app
