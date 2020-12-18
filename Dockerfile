FROM python:3.8.3-alpine

ENV PYTHONUNBUFFERED 1


COPY ./requirements.txt /requirements.txt


RUN apk update \
    && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app


RUN adduser -D user
USER user