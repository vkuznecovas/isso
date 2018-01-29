FROM python:2.7.14
RUN apt-get update
RUN apt-get -y install build-essential  git npm
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN apt-get -y install -y nodejs
RUN npm i -g bower requirejs uglify-js jade
COPY . /usr/local/isso
WORKDIR /usr/local/isso
RUN make init && make js
RUN python setup.py install && chmod +x /usr/local/isso/run.sh
EXPOSE 8080
VOLUME /db /config
CMD ["/usr/local/isso/run.sh"]
