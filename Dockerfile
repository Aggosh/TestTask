FROM python:3.8

ENV PYTHONDONTWRITBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
ADD TestTask /app/
ADD requirements.txt /app/
ADD Procfile /app/

ENV PORT=8888

RUN pip3 install -r requirements.txt

RUN apt-get update && apt-get -y install cron

# EXPOSE 8888
CMD gunicorn TestTask.wsgi:application --bind 0.0.0.0:$PORT
