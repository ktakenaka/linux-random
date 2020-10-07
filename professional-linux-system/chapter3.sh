# connect several servers with FC (Fibre Channel) Cable with SAN switch
# SAN(Storage Area Network): technology to make logical network between server and storage
# every devise connected to SAN switch has WWNN(World Wide Node Name), which is 64 bits address
# ... And further more, every devise having WWNN has several FC ports, which has WWPN (64 bits address)
# so complicated

# several disk drive => RAID array
# write data in the unit of "stripe", "block" * number of disks => stripe
# LUN (logical unit number): logical drive, this is awsome!
#   make LUN over the RAID => associate with servers
#   the server recognize LUN as 1 disk drive
# If we prepare many RAID array, LUN can be bigger and bigger??

# Linux is using several drivers, when you mount 1 disk driver.
#   able to access the disk through Controller A and B

# ----- Management of LVM -----
# It's meritfull to use LVM (logical volume manager) to manage disk accessing Data.
#   e.g combine several physical disks and make big volume file system
# Actually it's not so meritfull to use both of LVM and SAN at the same time, because both provide similar features

reboot
sudo pvcreate /dev/block/1\:0
sudo lvcreate -i 2 -L 5G -n lv_data01
sudo pvs # who physical volume
#   PV         VG   Fmt  Attr PSize  PFree 
#   /dev/ram0       lvm2 ---  64.00m 64.00m
#   /dev/ram1       lvm2 ---  64.00m 64.00m

# just tried to mount the volume
sshfs linux-tutorial@xxx:xxx:xxx:xxx:/mount ./mount
umount ./mount

# ----- iSCSI -----
# iSCSI: the technology to build SAN with IP network instead of FC switch
#   use adaptor card (hardware initiator) or NIC
sudo apt install targetcli

# 1. configure iptable/firewall
# 2. `pvcreate`, `vgcreate`, `lvcreate`
# 3. targetcli ls /

