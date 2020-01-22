FROM ruby:2.5.5
 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
 
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
 
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

# To use nc command
RUN apt-get update && apt-get install -y netcat

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
apt-get install nodejs
 
ENV APP_HOME /rails-vue-demo
 
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock

# To solve: `You must use Bundler 2 or greater with this lockfile`
RUN gem install bundler -v '2.0.2'
RUN bundle --version

# To solve: `library not found for -lssl`
RUN gem install mysql2 --source 'https://rubygems.org/'
RUN bundle install

# To solve: `Webpacker can't find application in /rails-vue-demo/public/packs/manifest.json`
RUN yarn add @rails/webpacker && bundle update webpacker

ADD . $APP_HOME

EXPOSE 3000