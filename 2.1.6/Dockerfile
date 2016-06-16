FROM ruby:2.1.6
MAINTAINER Justin Campbell <justin@justincampbell.me>

# Bundler
RUN gem install bundler --no-document

# bundle-cache
RUN gem install bundle_cache --no-document

# Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

# Bower
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc

# Ember CLI
RUN npm install -g ember-cli

# aws-cli
RUN apt-get install -y unzip
RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
