FROM popatry/anaconda-cuda:python3-miniconda-cuda9.0-cudnn7-runtime-ubuntu16.04
LABEL maintainer "ThoughtWorks <atryyang@thoughtworks.com>"

RUN . /opt/conda/etc/profile.d/conda.sh && \
    conda activate base && \
    conda install anaconda-project && \
    opt/conda/bin/conda clean -tipsy

# Workaround for https://github.com/conda/conda/issues/6378
RUN mkdir -p /opt/conda/pkgs/cache && chmod --recursive o+rw /opt/conda/pkgs /opt/conda/pkgs/cache 
