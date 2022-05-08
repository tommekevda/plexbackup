FROM ubuntu:latest

RUN apt update
RUN apt upgrade -y
RUN apt install rsync -y
RUN apt install cron -y
RUN apt install nano -y
#COPY rsynccron /etc/cron.d/rsynccron
COPY run_rsync.sh /root/
# RUN chmod 0755 /etc/cron.d/rsynccron
RUN chmod 0755 /root/run_rsync.sh
# RUN crontab /etc/cron.d/rsynccron
RUN crontab -l | { cat; echo "*/1 * * * * /root/run_rsync"; } | crontab -
RUN mkdir /from ; mkdir /to
RUN touch /var/log/cron.log
VOLUME ["/from","/to"]

CMD tail -f /var/log/cron.log