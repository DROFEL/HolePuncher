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

# Specify the default port the server will run on
ENV PORT 8080

# Set the entry point to run the server script with Python3
ENTRYPOINT ["python3", "./Server.py"]

# Use CMD to set default parameters for ENTRYPOINT
CMD ["$PORT"]


