FROM ubuntu:16.04

MAINTAINER Jacob Pfeil, jpfeil@ucsc.edu

# Update and install required software
RUN apt-get update --fix-missing \
    && apt-get install -y python python-matplotlib zlib1g-dev \
                          build-essential make wget libgl1-mesa-glx \
                          libboost-all-dev llvm autotools-dev libicu-dev \
                          g++ parallel \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install miniconda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p $HOME/miniconda

ENV PATH=/root/miniconda/bin:$PATH

RUN conda update -y conda

RUN conda install -y seaborn numpy pandas

RUN pip install pystan

COPY mixture /opt/mixture

ENV TH_MIXTURE_SRC=/opt/mixture

WORKDIR /opt

RUN wget https://github.com/stan-dev/cmdstan/releases/download/v2.17.0/cmdstan-2.17.0.tar.gz -O /opt/cmdstan-2.17.0.tar.gz \
    && tar xvf /opt/cmdstan-2.17.0.tar.gz \
    && cd /opt/cmdstan-2.17.0 \
    && echo "CC=g++" > make/local \
    && make build -j 4

RUN cd /opt/cmdstan-2.17.0 && parallel make {.} ::: /opt/mixture/models/*.stan

ENV STAN_SRC=/opt/cmdstan-2.17.0

# Data processing occurs at /data
WORKDIR /data

ENTRYPOINT ["python", "/opt/mixture/run.py"]
CMD ["-h"]
