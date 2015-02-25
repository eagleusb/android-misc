#!/system/bin/sh
dd if=/dev/zero of=/storage/sdcard0/swapfile bs=1048576 count=400
mkswap /storage/sdcard0/swapfile
chown root:root /storage/sdcard0/swapfile
chmod 0600 /storage/sdcard0/swapfile
echo "/storage/sdcard0/swapfile swap swap defaults 0 0" > /etc/fstab  
swapon -a 