FROM ubuntu:latest

RUN apt update
RUN apt upgrade -y
RUN apt install rsync -y
RUN apt install cron -y
RUN apt install nano -y
RUN apt install zip -y
# COPY rsynccron /etc/cron.d/rsynccron
COPY run_rsync.sh /root/
COPY run_lib_tar.sh /root/
# RUN chmod 0755 /etc/cron.d/rsynccron
RUN chmod 0644 /root/run_rsync.sh
RUN chmod 0644 /root/run_lib_tar.sh
# RUN crontab /etc/cron.d/rsynccron
RUN crontab -l | { cat; echo "30 10 * * * /root/run_rsync"; } | crontab -
RUN crontab -l | { cat; echo "0 7 * * sun /root/run_lib_tar.sh"; } | crontab -
RUN mkdir /from-backup ; mkdir /from-lib ; mkdir /to
RUN touch /var/log/cron.log
VOLUME ["/from-lib", "/from-backup", "/to"]

CMD cron ; tail -f /var/log/cron.log