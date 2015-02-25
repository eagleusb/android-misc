#!/system/bin/sh

#FS
busybox mount -o remount,norelatime,noatime,nodiratime /mnt/media_rw/sdcard1;
busybox mount -o remount,noatime,nodiratime,data=writeback /system;
busybox mount -o remount,noatime,nodiratime,data=writeback /cache;
busybox mount -o remount,noatime,nodiratime,data=writeback /data;


#Network
busybox sysctl -w net.ipv4.icmp_echo_ignore_all=1;
busybox sysctl -w net.ipv4.conf.default.rp_filter=1;
busybox sysctl -w net.ipv4.conf.all.rp_filter=1;
busybox sysctl -w net.ipv4.conf.all.accept_redirects=0;
busybox sysctl -w net.ipv4.conf.all.send_redirects=0;
busybox sysctl -w net.ipv4.tcp_fin_timeout=45;
busybox sysctl -w net.ipv4.tcp_no_metrics_save=1;
busybox sysctl -w net.ipv4.tcp_syncookies=1;
busybox sysctl -w net.core.netdev_max_backlog=2500;
busybox sysctl -w net.ipv4.tcp_tw_reuse=1;
busybox sysctl -w net.ipv4.tcp_tw_recycle=1;


#How much the kernel favors swap over RAM
busybox sysctl -w vm.swappiness=15;
#The highest % of your memory that can be used to hold dirty data. If you set this to a low value, the kernel will flush small writes to the disk more often
busybox sysctl -w vm.dirty_ratio=85;
#Defines the percentage of memory that can become dirty before a background flushing of the pages to disk starts
busybox sysctl -w vm.dirty_background_ratio=70;
#Tendency of the kernel to reclaim the memory which is used for caching of directory and inode objects
busybox sysctl -w vm.vfs_cache_pressure=35;

#busybox swapon /storage/sdcard0/swapfile;

#SDCard Cache
echo 4096 > /sys/devices/virtual/bdi/179:97/read_ahead_kb;