FROM ubuntu:17.10

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

RUN useradd dev && \
    echo "dev  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get install -y vim git wget tmux zsh

ENV HOME /home/dev

WORKDIR /home/dev

RUN chown -R dev:dev $HOME
USER dev

CMD zsh
