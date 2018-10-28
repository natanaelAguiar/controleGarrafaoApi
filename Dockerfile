FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN gem install rails -v 5.2.1
WORKDIR /app
COPY controleGarrafao/ /app
RUN bundle install
EXPOSE 3000
COPY controleGarrafao/docker/docker_entrypoint.sh /usr/bin/docker_entrypoint.sh
RUN chmod +x /usr/bin/docker_entrypoint.sh
ENTRYPOINT ["docker_entrypoint.sh"]
