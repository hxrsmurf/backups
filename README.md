
# b2-gce<span></span>.sh
The actual backup script I use, with infos removed. Backups to Backblaze's B2 and Google's Storage (Regional Storage). Includes date-timestamp (copied from Seafile's manual) and e-mails me when complete.

"--threads 0" - allows to use all threads
"-m" - uses all resources available

# commands-to-migrate.txt
I frequently migrate between hosts. Historically, I've moved from DigitalOcean, to Linode, to Google Compute Engine, to my own server with OVH (SoYouStart), and now finally back to DigitalOcean. These are the frequent commands I use to setup the new environment and migrate over. I've been meaning to script all of this. So, putting on Github is a good first step. 

# setup-b2.txt
Setting up gsutil is easy too. I could put that there, but Googling that is quicker. Googling B2 is easy too...

* https://www.backblaze.com/b2/docs/quick_command_line.html
* https://cloud.google.com/storage/docs/gsutil_install
