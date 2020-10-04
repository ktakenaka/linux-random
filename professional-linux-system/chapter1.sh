# show which OS can be used (boot loader)
grep "^menuentry" /boot/grub/grub.cfg | cut -d "'" -f2
# list block devises
lsblk -d

dd if=hoge.txt of=fuga.txt # comes from "Data Definition". It derives from "DD statement" of IBM mainframe Job Control Language
# "sudo dd if=/dev/null of=/dev/mmcblk0p1" => copy /dev/hoge partition on hard disk to another disk

useradd bamboo
passwd bamboo
usermod -G root bamboo
id bamboo # uid=1003(bamboo) gid=1003(bamboo) groups=1003(bamboo),0(root). Check if 'bamboo' belongs the group

sudo -i # switch to root user
less /var/log/auth.log # confirm the log of auth, such as login/logout

systemctl restart sshd.service # after configuring sshd_config, in which root login is prohibited, need to restart ssh daemon

# I don't fully understand the following commands, when I use, I will re-learn
blkid # show block ids
sudo sfdisk /dev/nvme0n1

# ----- ssh usage -----
# register ssh key to the server
# the key will be save in ~/.ssh/authorized_keys
ssh-copy-id linux_tutorial
ssh linux_tutorial "uname -a"
