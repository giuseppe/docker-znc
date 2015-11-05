#!/bin/sh

chown -R znc:znc /znc-data
exec sudo -u znc /usr/bin/znc --foreground --datadir=/znc-data
