FROM python:3.6-stretch

# install build utilities
RUN apt-get update

# check our python environment
RUN python3 --version
RUN pip3 --version

# set the working directory for containers
WORKDIR  /usr/src/mymodel

# Installing python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files from the project’s root to the working directory
COPY src/ /src/
RUN ls -la /src/*
RUN ls -l /usr/src/mymodel/
# Running Python Application
ENTRYPOINT ["python3", "/src/main.py"]
