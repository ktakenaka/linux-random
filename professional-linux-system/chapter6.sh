ll /var/log # 様々なlogファイルがみれる
dmesg # show kernel log buffer

logrotate # logrotateのコマンド、pdevでタイムスタンプが押されて、日時のログをだしてるのは、このコマンド使ってる
less /etc/logrotate # logrotateの設定内容が見れる

uname -a
df -h
free -d
free -h
ip a
ss -nat
uptime
last
w
lsof

lscpu
lsblk
lspci
lsmod
cat /proc/interrupts

sudo tcpdump tcp dst port 80 

# 6.2 カーネルダンプの取得
dstat -v
top -b -n 10 -d 60 > /tmp/top/output.txt
