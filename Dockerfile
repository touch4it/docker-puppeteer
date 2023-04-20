# Based on https://github.com/puppeteer/puppeteer/blob/main/docker/Dockerfile

FROM node:18.16.0-bullseye-slim

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
RUN apt-get update \
  && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    --no-install-recommends \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install -y \
    google-chrome-stable \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-khmeros \
    fonts-kacst \
    fonts-freefont-ttf \
    libxss1 \
    --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -r pptruser \
  && useradd -rm -g pptruser -G audio,video pptruser

USER pptruser

WORKDIR /home/pptruser

COPY package*.json .

RUN npm ci

CMD ["google-chrome-stable"]
