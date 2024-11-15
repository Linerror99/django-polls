#Ecrire un dockerfile

FROM python:3.9-slim
ARG VERSION=lastest


WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . .
EXPOSE 8003

RUN python manage.py migrate
CMD ["python","manage.py","runserver", "0.0.0.0:8003"]
