FROM ruby:2.3.3
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

# Yarn
RUN npm install -g yarn

# Ember CLI
RUN npm install -g ember-cli

# aws-cli
RUN apt-get install -y python-dev unzip
RUN \
      curl --location https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip && \
      unzip awscli-bundle.zip && \
      ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
      rm -rf awscli-bundle*

# Watchman
RUN apt-get install -y python-dev
RUN \
      curl --location https://github.com/facebook/watchman/archive/v4.7.0.tar.gz -o watchman.tar.gz && \
      tar zxvf watchman.tar.gz && \
      cd watchman-* && \
      ./autogen.sh && \
      ./configure && \
      apt-get install -y python-dev && \
      make && \
      make install && \
      cd .. && \
      rm -rf watchman*

# Cleanup
RUN apt-get remove -y python-dev unzip
