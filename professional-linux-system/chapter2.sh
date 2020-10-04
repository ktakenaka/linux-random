# types of faults
# - system failures
# - resource monitoring
# - security monitoring

# system administration processor manages hard wares.
#   It notifies admins when discdrive is broken or error occurs on memory
#   It's not recommended to use sys log to detect hardware fault
# When you allocate a specific IP to your system managing processor, you can send email or SNMP trap

# Monitor Device => log on file => monitor file => detect the change of the file => notify
# This is the common strategy

# ----- hardware monitoring tool -----
# IPMI driver to get system managing processor information
# ref: http://manpages.ubuntu.com/manpages/trusty/man1/ipmitool.1.html
sudo apt-get install ipmitool

sudo systemctl enable ipmievd.service
# Synchronizing state of ipmievd.service with SysV init with /lib/systemd/systemd-sysv-install...
# Executing /lib/systemd/systemd-sysv-install enable ipmievd
# Created symlink from /etc/systemd/system/ipmi.service to /lib/systemd/system/ipmievd.service.

# I wonder xymon uses ipmitool?

dpkg -l | grep ipmi

# ipmi should be configured correctly, but it couldn't go well.
# I've given up temporarilly

# ----- logfile monitoring tool -----
# After setting up logmon...
sudo systemctl start logmon.service
sudo systemctl status logmon.service

# ----- resource monitoring tool -----
sudo apt-get install sysstat
sudo sed -i 's/ENABLED="false"/ENABLED="true"/g' /etc/default/sysstat
sudo systemctl restart sysstat
sar
# Linux 4.4.0-1052-aws (ip-172-26-3-166) 	10/03/2020 	_x86_64_	(1 CPU)
# 12:02:27 PM  LINUX RESTART	(1 CPU)

sudo apt-get install logwatch
sudo /etc/cron.daily/00logwatch

# ----- Backup -----
# We have 2 ways for backup
# 1. full backup + incremental backup => good in the point of volume cosumed
# 2. full backup + defferential backup => easy to restore
# => decide from business requirement (backup requirement)

# rsync incrementally updates, so better than copying
rsync -av data/ backup
# you can sync files through the network as follows
# rsync -av data/ root@xxx.xxx.xxx.xxx:backup
