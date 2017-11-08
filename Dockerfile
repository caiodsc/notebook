FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

# install npm
RUN apt-get install -y -qq npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# install bower
RUN npm install --global bower

RUN mkdir /notebook

WORKDIR /notebook

ADD Gemfile /notebook/Gemfile
ADD Gemfile.lock /notebook/Gemfile.lock

RUN bundle install
ADD . /notebook