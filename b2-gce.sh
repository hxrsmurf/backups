#!/bin/bash

b2 sync --threads 0 /var/www/hxrsmurf.info/ b2://digitalocean-26feb2018/hxrsmurf.info/
b2 sync --threads 0 /var/www/kvchmurphy.com/ b2://digitalocean-26feb2018/kvchmurphy.com/
b2 sync --threads 0 /var/www/photos.hxrsmurf.info/ b2://digitalocean-26feb2018/photos.hxrsmurf.info/
b2 sync --threads 0 /etc/apache2/sites-available/ b2://digitalocean-26feb2018/apache2-sites-available/
b2 sync --threads 0 /etc/letsencrypt/ b2://digitalocean-26feb2018/letsencrypt/
b2 sync --threads 0 /root/backup-sql/ gs://digitalocean-26feb2018/backup-sql/

gsutil -m rsync -r -d /var/www/hxrsmurf.info/ gs://digitalocean-26feb2018/hxrsmurf.info/website/
gsutil -m rsync -r -d /var/www/kvchmurphy.com/ gs://digitalocean-26feb2018/kvchmurphy.com/website/
gsutil -m rsync -r -d /var/www/photos.hxrsmurf.info/ gs://digitalocean-26feb2018/photos.hxrsmurf.info/website/
gsutil -m rsync -r -d /etc/apache2/sites-available/ gs://digitalocean-26feb2018/apache2-sites-available/
gsutil -m rsync -r -d /etc/letsencrypt/ gs://digitalocean-26feb2018/letsencrypt/
gsutil -m rsync -r -d /root/backup-sql/ gs://digitalocean-26feb2018/backup-sql/

mysqldump -u root -h localhost -predacted dreams > /root/backup-sql/dreams.sql.`date +"%Y-%m-%d-%H-%M-%S"`
mysqldump -u root -h localhost -predacted photos > /root/backup-sql/photos.sql.`date +"%Y-%m-%d-%H-%M-%S"`
mysqldump -u root -h localhost -predacted wordpress > /root/backup-sql/wordpress.sql.`date +"%Y-%m-%d-%H-%M-%S"`

echo "Backup completed to DigitalOcean `date +'%Y-%m-%d'`" | sendmail -f backup@kvchmurphy.com -t kevin@kvchmurphy.com
