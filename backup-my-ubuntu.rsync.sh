# This is to backup a whole Ubuntu system into any drive like USB, ... etc

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
/ /media/usb/



# https://wiki.ubuntu.com/Grub2#Recover Grub 2 via LiveCD
# Recover Grub 2 via LiveCD
# ===============================================================================
# 
# $ sudo fdisk -l
# 
# Now, you need to remember which device listed is your linux distribution, for reference, /dev/sda1 will be used. Now we need to mount the filesystem to /mnt
# $ sudo mount /dev/sda1 /mnt
# 
# If you have /boot on a separate partition, that need's to be mounted aswell. For reference, /dev/sda2 will be used.
# $ sudo mount /dev/sda2 /mnt/boot
# 
# If you have /var on a separate partition, that need's to be mounted aswell. For reference, /dev/sda3 will be used.
# $ sudo mount /dev/sda3 /mnt/var Make sure you don't mix these up, pay attention to the output of FDISK
# 
# Now mount the rest of your devices and some other things needed in the chroot
# $ sudo mount --bind /dev /mnt/dev
# $ sudo mount --bind /proc /mnt/proc
# $ sudo mount --bind /sys /mnt/sys
# 
# Now chroot into your system
# $ sudo chroot /mnt
# 
# You should be chroot'd into your system as root, you can now run commands as root, without the need for sudo.
# 
# Now you need to edit the /etc/default/grub file to fit your system
# $ nano /etc/default/grub
# 
# When that is done you need to run update-grub to create the configuration file. If you have a separate /boot partition you need to mount it first!
# $ update-grub
# 
# To install GRUB 2 to the MBR, next you need to run grub-install /dev/sda
# $ grub-install /dev/sda
# 
# If you encounter any errors, try grub-install --recheck /dev/sda
# $ grub-install --recheck /dev/sda
# 
# Press Ctrl+D to exit out of the chroot.
# Once you exit back to your regular console, undo all the mounting, first the /dev and others
# $ sudo umount /mnt/dev
# $ sudo umount /mnt/sys
# $ sudo umount /mnt/proc
# 
# Now you can unmount the root system. (But if you have a separate boot partition which you mounted earlier, you have to unmount this first, or you will get a "device busy" error message.)
# $ sudo umount /mnt
# 
# And you should be free to restart your system right into GRUB 2 and then into your system installation.
# If you had alternate OS entries, update-grub might say "Cannot find list of partitions!". Ignore it and continue - once you can boot into your linux installation, do so and then rerun update-grub and grub-install /dev/sda as root.
# 
# Restore GRUB2 - Recovering from a Windows XP / Vista / 7 Reinstallation
# ===============================================================================
# Fire up a terminal from the Live CD for Ubuntu 10.04.
# $ sudo fdisk -l (Note the partition number on which Linux resides)
# $ sudo mount /dev/sdaX /mnt (Replace X with the partition number housing Linux)
# $ sudo grub-install --root-directory=/mnt/ /dev/sda
# $ sudo update-grub
# $ sudo reboot
