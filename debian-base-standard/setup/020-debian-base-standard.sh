#!/bin/bash

set -e
set -x

mv /usr/sbin/policy-rc.d.disabled /usr/sbin/policy-rc.d
apt-get update
apt-get -y --no-install-recommends install less nano vim-tiny man-db \
        exim4-daemon-light bsd-mailx pwgen gnupg gnupg2 \
        netcat-openbsd socat openssl ssh telnet net-tools wget curl zip unzip

apt-get -y -u dist-upgrade
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

/usr/local/bin/docker-wipelogs
rm -v /etc/ssh/*key*
mv /usr/sbin/policy-rc.d /usr/sbin/policy-rc.d.disabled
ln -s /usr/bin/vim.tiny /usr/local/bin/vim
