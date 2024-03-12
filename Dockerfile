FROM python:3.7-alpine

EVY PYTHONUNBUFFERED 1

copy ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUM mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
User user
