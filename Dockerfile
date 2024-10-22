FROM ghcr.io/rocker-org/verse:4.4.1

RUN apt-get update -y \
  && apt-get install --no-install-recommends -y \
  && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt-get install -y ./google-chrome-stable_current_amd64.deb \
  && rm -rf google-chrome-stable_current_amd64.deb \
  && rm -rf /var/lib/apt/lists/* \
  && Rscript -e 'install.packages(c("pagedown"),repos = "https://packagemanager.posit.co/cran/__linux__/jammy/latest");'

WORKDIR /rmd
