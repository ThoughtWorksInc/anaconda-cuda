FROM popatry/anaconda-cuda:python3-miniconda-cuda9.0-cudnn7-runtime-ubuntu16.04
LABEL maintainer "ThoughtWorks <atryyang@thoughtworks.com>"

# Workaround for https://github.com/conda/conda/issues/6576
RUN . /opt/conda/etc/profile.d/conda.sh && \
    conda activate base && \
    conda install -c conda-canary conda  && \
    opt/conda/bin/conda clean -tipsy
