FROM popatry/anaconda-cuda:python3-miniconda-canary-cuda9.0-cudnn7-runtime-ubuntu16.04
LABEL maintainer "ThoughtWorks <atryyang@thoughtworks.com>"

RUN . /opt/conda/etc/profile.d/conda.sh && \
    conda activate base && \
    conda install anaconda-project && \
    opt/conda/bin/conda clean -tipsy
