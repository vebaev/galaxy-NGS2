# Galaxy NGS image 2

FROM quay.io/vebaev/galaxy-ngs:19.01

MAINTAINER Vesselin Baev, vebaev@plantgene.eu

# Enable Conda dependency resolution
ENV GALAXY_CONFIG_BRAND="Galaxy NGS" \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True

# Install tools
COPY mothur.yaml $GALAXY_ROOT/tools_4.yaml
COPY qiime.yaml $GALAXY_ROOT/tools_5.yaml



# Installing Mothur and Qiime suits

RUN df -h && \
    install-tools $GALAXY_ROOT/tools_4.yaml && \
    /tool_deps/_conda/bin/conda clean --all --yes && \
    rm -rf /tool_deps/_conda/pkgs && \
    df -h

RUN df -h && \ 
    install-tools $GALAXY_ROOT/tools_5.yaml && \
    /tool_deps/_conda/bin/conda clean --all --yes && \
    rm -rf /tool_deps/_conda/pkgs && \
    df -h

