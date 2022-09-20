#!/bin/bash
# setup apt-cacher-ng in the containers

pkgbuilder="/home/cshort/work/starlingx/debian/workspace/localdisk/pkgbuilder/cshort/stx-debian/chroots"
for i in `ls $pkgbuilder | grep bullseye`; do
    echo 'Acquire::http { Proxy "http://localhost:3142"; };' > $pkgbuilder/$i/etc/apt/apt.conf.d/02proxy
    #rm -f $pkgbuilder/$i/etc/apt/apt.conf.d/02proxy
done
