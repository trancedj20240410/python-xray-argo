FROM python:3.9-alpine

RUN apk update && apk --no-cache add \
    curl \
    openssl \
    bash

COPY . /app
WORKDIR /app
RUN chmod -R 755 /temp && \
    chmod +x app.py && \
    pip install -r requirements.txt

CMD ["python", "app.py"]
