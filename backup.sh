#!/bin/bash

/mnt/seafile/seafile-server-latest/seafile.sh stop
/mnt/seafile/seafile-server-latest/seahub.sh stop

mysqldump -u seafile -h 127.0.0.1 --p[redacted] seafile-db > /mnt/seafile/sql/seafile.sql.`date +"%Y-%m-%d-%H-%M-%S"`
mysqldump -u seafile -h 127.0.0.1 --p[redacted] ccnet-db > /mnt/seafile/sql/ccnet.sql.`date +"%Y-%m-%d-%H-%M-%S"`
mysqldump -u seafile -h 127.0.0.1 --p[redacted] seahub-db > /mnt/seafile/sql/seahub.sql.`date +"%Y-%m-%d-%H-%M-%S"`
#mysqldump -u seafile -h 127.0.0.1 --p[redacted] dreams > /mnt/seafile/sql/dreams.sql.`date +"%Y-%m-%d-%H-%M-%S"`
#mysqldump -u seafile -h 127.0.0.1 --p[redacted] photos > /mnt/seafile/sql/photos.sql.`date +"%Y-%m-%d-%H-%M-%S"`
#mysqldump -u seafile -h 127.0.0.1 --p[redacted] wordpress > /mnt/seafile/sql/wordpress.sql.`date +"%Y-%m-%d-%H-%M-%S"`
#b2 sync --threads 0 /mnt/seafile/ b2://16gb-ovh/seafile/
#gsutil -m rsync -r -d /mnt/seafile/ gs://seafile-hxrsmurf/

/mnt/seafile/seafile-server-latest/seafile.sh start
/mnt/seafile/seafile-server-latest/seahub.sh start

#echo "Backup completed for Seafile `date +'%Y-%m-%d'`" | sendmail -f backup@hxrsmurf.info kevin@hxrsmurf.info

#/mnt/seafile/seafile-server-latest/seahub.sh restart-fastcgi
