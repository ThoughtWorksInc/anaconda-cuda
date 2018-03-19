FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
LABEL maintainer "ThoughtWorks <cdong@thoughtworks.com>"
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
RUN apt-get -qq update && apt-get install -y  build-essential libglu1-mesa libgtk2.0-0
RUN apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt update && \
    apt install -y gcc-6 g++-6
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.1.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh
ENV PATH /opt/conda/bin:$PATH
## avoid CI bug for https://github.com/dask/dask-drmaa/pull/57
RUN conda update --prefix /opt/conda anaconda && \
    conda update -n base conda
ENV CUDA_HOME /usr/local/cuda-9.0
CMD [ "/bin/bash" ]
