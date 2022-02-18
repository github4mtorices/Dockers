FROM httpd:2.4
COPY ./public-html/ /usr/local/apache2/htdocs/
RUN useradd -ms /bin/bash web
USER web
WORKDIR /web
