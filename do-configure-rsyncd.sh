#!/bin/bash


SHARED_DIR=

cat > /etc/default/rsync <<EOF

RSYNC_ENABLE=true

#
# this will run rsync IO at "idle" priority
#
RSYNC_IONICE='-c3'

EOF


cat > /etc/rsyncd.conf <<EOF

uid = nobody
gid = nogroup

log file = /var/log/rsyncd.log

[public]

path = $SHARED_DIR

read only = false

comment = dedicated directory for rsync upload

EOF

