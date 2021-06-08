#!/bin/bash
#USO SCRIPT: backup_home_cliente-03

rsync -avzP --log-file=/media/disco_backups/logs/cliente-03.sh_`date "+%Y-%m-%d_%H-%M-%S"`.log --delete --exclude ".cache" -e ssh root@192.168.20.3:/home/ /media/disco_backups/backup_cliente-03/
