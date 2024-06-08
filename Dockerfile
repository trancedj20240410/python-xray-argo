FROM python:3.10-alpine

WORKDIR /app

COPY . .

EXPOSE 3000

RUN apt-get install -y curl &&\
    apk update && apk --no-cache add openssl bash curl &&\
    chmod -R 755 /temp &&\
    chmod +x app.py &&\
    pip install -r requirements.txt
    
CMD ["python3", "app.py"]
