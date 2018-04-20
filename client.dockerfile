FROM python:3
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y postgresql-client
RUN pip install -U pip && pip install psycopg2-binary
WORKDIR /
ADD client.py .
ENTRYPOINT ["python3"]
CMD ["client.py"]
