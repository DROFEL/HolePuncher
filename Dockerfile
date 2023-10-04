# Use a Python 3 base image
FROM python:3.9-slim

# Set the working directory in Docker
WORKDIR /usr/src/app

# Install Twisted and other required dependencies
RUN pip install twisted

# Install git and clone the udp-hole-punching repository
RUN apt-get update && \
    apt-get install -y git && \
    git clone https://github.com/DROFEL/HolePuncher.git .

# Set the entry point to explicitly run the server script with Python3 and the specified port
ENTRYPOINT ["python3", "./Server.py", 8080]


