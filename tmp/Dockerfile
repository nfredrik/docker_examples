FROM ruby:2.4.1-alpine
MAINTAINER Freddan Svard <fredrik@svard.com>

ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base
#ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler
ENV RUBY_PACKAGES ruby-io-console

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/* && \
    gem install bundler

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
#RUN gem install bundler
RUN bundle check || bundle install -j20

COPY . /usr/app
#CMD '/usr/app/main.rb'
#CMD 'ruby -v'