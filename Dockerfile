FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get install nodejs-legacy
RUN apt-get install -y -qq npm
RUN npm install --global bower --allow-root

RUN mkdir /notebook
WORKDIR /notebook

ADD Gemfile /notebook/Gemfile
ADD Gemfile.lock /notebook/Gemfile.lock

RUN bundle install
ADD . /notebook
