FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
LABEL maintainer "ThoughtWorks <atryyang@thoughtworks.com>"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates curl git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> /etc/bash.bashrc && \
    echo "conda activate base" >> /etc/bash.bashrc

# Workaround for https://github.com/conda/conda/issues/6378
RUN mkdir -p /opt/conda/pkgs/cache && chmod --recursive o+rw /opt/conda/pkgs /opt/conda/pkgs/cache 

ENV CUDA_HOME /usr/local/cuda-9.0
