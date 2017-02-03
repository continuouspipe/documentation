FROM nginx

# Install pygments (for syntax highlighting)
RUN apt-get -qq update \
	&& DEBIAN_FRONTEND=noninteractive apt-get -qq install -y --no-install-recommends python-pygments git ca-certificates npm \
	&& rm -rf /var/lib/apt/lists/*

# Download and install hugo
ENV HUGO_VERSION 0.18.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}-64bit.deb

ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb \
 && rm /tmp/hugo.deb

# Create working directory
RUN mkdir /app
WORKDIR /app

COPY . /app


# Automatically build site
RUN npm install \
  && rm -rf themes/hugo-material-docs \
  && rm -rf public \
  && git clone https://github.com/digitalcraftsman/hugo-material-docs themes/hugo-material-docs \
  && hugo -d /usr/share/nginx/html/
  && gulp


# By default, serve site
ENV HUGO_BASE_URL http://localhost
ENV HUGO_PORT 80
CMD hugo server -b ${HUGO_BASE_URL} -p ${HUGO_PORT} --bind=0.0.0.0
