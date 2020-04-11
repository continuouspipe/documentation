FROM debian:stretch-slim AS build

# Install pygments (for syntax highlighting)
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates rsync \
	&& rm -rf /var/lib/apt/lists/*

# Download and install hugo
ENV HUGO_VERSION 0.18
ENV HUGO_BINARY hugo_${HUGO_VERSION}-64bit.deb

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
 && rm /tmp/hugo.deb

# Create working directory
RUN mkdir /app
WORKDIR /app

COPY . /app

# Build the documentation
RUN rm -rf themes/hugo-material-docs \
  && git clone https://github.com/digitalcraftsman/hugo-material-docs themes/hugo-material-docs \
  && cd themes/hugo-material-docs \
  && git checkout 194c497216c8389e02e9719381168a668a0ffb05 \
  && cd ../../ \
  && hugo -d /usr/share/nginx/html/

FROM nginx:1.17-alpine
COPY --from=build --chown=root:root /usr/share/nginx/html/ /usr/share/nginx/html/
ENV PORT=80
CMD /bin/sh -c 'sed -i"" "s/listen\s*80;/listen $PORT;/" /etc/nginx/conf.d/default.conf && exec nginx -g "daemon off;"'
