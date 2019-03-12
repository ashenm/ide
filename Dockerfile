FROM ashenm/baseimage:developer

ARG USER_PASSWORD=ashenm
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
    dirmngr \
    gdebi-core && \
  rm -rf /var/lib/apt/lists/*

RUN echo 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' | \
    tee /etc/apt/sources.list.d/cran.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
  apt-get update && \
  apt-get install --yes --no-install-recommends \
    r-base && \
  curl -sSLo /tmp/rstudio-server-1.1.463-amd64.deb https://download2.rstudio.org/rstudio-server-1.1.463-amd64.deb && \
  gdebi --non-interactive /tmp/rstudio-server-1.1.463-amd64.deb && \
  rm -rf /var/lib/apt/lists/* /tmp/rstudio-server-1.1.463-amd64.deb

RUN groupadd --gid 1000 ashenm && \
  useradd --create-home --uid 1000 --gid ashenm --groups sudo ashenm && \
  echo "ashenm:$USER_PASSWORD" | chpasswd

COPY sbin /usr/local/sbin/
COPY etc /etc/

ENTRYPOINT ["/usr/local/sbin/ide"]
