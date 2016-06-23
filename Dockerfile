FROM ruby
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
RUN \
      curl --location https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip && \
      apt-get install -y unzip && \
      unzip awscli-bundle.zip && \
      apt-get remove -y unzip && \
      ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws && \
      rm -rf awscli-bundle*

# Watchman
RUN \
      curl --location https://github.com/facebook/watchman/archive/v4.5.0.tar.gz -o watchman.tar.gz && \
      tar zxvf watchman.tar.gz && \
      cd watchman-* && \
      ./autogen.sh && \
      ./configure && \
      apt-get install -y python-dev && \
      make && \
      apt-get remove -y python-dev && \
      make install && \
      cd .. && \
      rm -rf watchman*
