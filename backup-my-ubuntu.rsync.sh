sudo rsync -arvu \
--delete \
--exclude '/proc/*' \
--exclude '/lost+found/*' \
--exclude '/dev/*' \
--exclude '/mnt/*' \
--exclude '/media/*' \
--exclude '/sys/*' \
--exclude '/tmp/*' \
--exclude '/var/cache/apt/*' \
--exclude '/home/aromazhou/.Trash/*' \
--exclude '/home/aromazhou/.cache/*' \
--exclude '/home/aromazhou/.gvfs' \
--exclude '/home/aromazhou/.mozilla/firefox/*' \
/ /media/w400g/backup.ubuntu.system/


