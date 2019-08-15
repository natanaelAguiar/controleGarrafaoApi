FROM ruby:2.6.3

COPY controleGarrafao/ /home/docker/controleGarrafao
COPY controleGarrafao/docker/docker_entrypoint.sh /usr/bin/docker_entrypoint.sh

WORKDIR /home/docker/controleGarrafao

RUN chmod +x /usr/bin/docker_entrypoint.sh

RUN useradd -m docker && echo "docker:docker" | \
    chpasswd

RUN echo "docker ALL=(ALL:ALL) NOPASSWD: ALL" | \ 
    tee -a /etc/sudoers

RUN chown docker:docker /home/docker/
RUN chown -R docker:docker /home/docker/controleGarrafao

USER docker
RUN bundle install
EXPOSE 3000

ENTRYPOINT ["docker_entrypoint.sh"]
