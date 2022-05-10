#!/bin/bash
rsync -r -t --verbose --human-readable /from-backup/* /to >> /var/log/cron.log 2>&1