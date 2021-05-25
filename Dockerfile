FROM python:3.9-slim

ENV PYTHONBUFFERED True

COPY ./src ./

RUN pip install -r requirements.txt

CMD exec gunicorn --bind :${PORT} --workers 1 --threads 8 --timeout 0 main:app