FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN exit
RUN gem install rails -v 5.2.1
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN bundle install
EXPOSE 3000
