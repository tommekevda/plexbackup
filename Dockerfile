FROM ubuntu:latest

RUN apt update
RUN apt upgrade -y
RUN apt install rsync -y
RUN apt install cron -y
COPY rsynccron /etc/cron.d/rsynccron
RUN chmod 0744 /etc/cron.d/rsynccron
RUN crontab /etc/cron.d/rsynccron
RUN mkdir /from ; mkdir /to
VOLUME ["/from","/to"]

CMD tail -f /var/log/cron