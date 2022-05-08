#!/bin/bash
rsync -r -t --verbose --human-readable /from/* /to >> /var/log/cron.log 2>&1