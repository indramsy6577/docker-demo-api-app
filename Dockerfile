FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

copy ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN pip install --upgrade pip 

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D user
User user
