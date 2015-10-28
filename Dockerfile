FROM ruby:2.1.6

# Bundler
RUN gem install bundler --no-document

# bundle-cache
RUN gem install bundle_cache --no-document

# Node.js
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs

# aws-cli
RUN apt-get install -y unzip
RUN curl https://s3.amazonaws.com/aws-cli/awscli-bundle.zip -o awscli-bundle.zip
RUN unzip awscli-bundle.zip
RUN ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
