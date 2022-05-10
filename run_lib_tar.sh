#!/bin/bash
tar zcvf /from-lib/* /to/plexlib-${date +%Y-%m-%d}.tar.gz >> /var/log/cron.log 2>&1
