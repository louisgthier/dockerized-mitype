# Use an official lightweight Python image.
# alpine is much smaller than the standard Python image.
FROM python:3.11.7-alpine3.19

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the dependencies file to the working directory
COPY requirements.txt ./

# Update the package list
RUN apk update && apk upgrade

# Upgrade all dependencies
RUN pip install --upgrade --no-cache-dir pip setuptools wheel

# Install and upgrade dependencies
RUN pip install --upgrade --no-cache-dir -r requirements.txt

# Copy the script to the container
COPY . .

RUN adduser -D appuser
USER appuser

# Command to run on container start
CMD [ "mitype" ]
