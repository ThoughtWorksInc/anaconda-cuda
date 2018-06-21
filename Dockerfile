FROM popatry/anaconda-cuda:python3-miniconda-cuda9.0-cudnn7-runtime-ubuntu16.04-anaconda-project
LABEL maintainer "ThoughtWorks <atryyang@thoughtworks.com>"

RUN apt-get update --fix-missing && \
    apt-get install -y socat && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
