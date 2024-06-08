# Use a base image (Debian-based or Alpine-based)
FROM python:3.9-slim

# Install dependencies for Debian-based image
RUN apt-get update && apt-get install -y \
    curl \
    openssl \
    bash && \
    rm -rf /var/lib/apt/lists/*

# For Alpine-based image, use the following RUN command instead:
# RUN apk update && apk --no-cache add \
#     curl \
#     openssl \
#     bash

# Set up the working directory
WORKDIR /app

# Copy the application files
COPY . /app

# Ensure the /temp directory exists and set permissions
RUN mkdir -p /temp && \
    chmod -R 755 /temp

# Ensure app.py exists and set execute permissions
RUN chmod +x app.py

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python", "app.py"]
