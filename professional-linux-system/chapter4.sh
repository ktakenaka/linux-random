# --- basic of IP network ---
# The difference of L2 and L3 switch
#   L2 has router function, L3 doesn't have router function
#   L2 doesn't understand IP (only recognizes MAC address)
#   FYI: packet => MAC address + IP address + data
# the devices under a same subnet mask directly send packets without router

# ARP table: IP address <=> MAC address
# Linux get to know the IP by ARP table
ip n # show ARP table
ip l # show its own MAC address

ip r # show routing table
# default via 172.26.0.1 dev eth0 => default, send packets to 172.26.0.1(default gateway) from NIC[eth0] and default gateway will handle it.
# 172.26.0.0/20 dev eth0  proto kernel  scope link  src 172.26.3.166 => the packet to 172.26.0.0/20 will be throught NIC[eth0], "scope like" means the packet will not be sent without router (=not equal)

# --- Network Architecture ---
# redundant network
#   several L2 connect to L3
# VLAN (Virtual LAN)
#   define vertual subnet inside switch

nmcli d
# DeviceがNICのDevice名、Connectionが接続の名前
# DEVICE           TYPE      STATE        CONNECTION         
# wlp2s0           wifi      connected    Somerset D1Mension 
# br-a8eb14163357  bridge    connected    br-a8eb14163357    
# docker0          bridge    connected    docker0   

nmcli c # "c" はconnectionのこと
# NAME                        UUID                                  TYPE      DEVICE          
# Somerset D1Mension          646b72b3-e2f5-4ac2-b46a-7a3c6b114705  wifi      wlp2s0 

nmcli d show wlp2s0 # "d" はdeviceのこと
# このコマンドでdeviceの設定内容などがみれる

# - スイッチにはL2とL3があり、
#     -  L2：ルーターの機能を持たない
#     -  L3：ルーターの機能を持つ
# - ルーターとは、サブネットをまたいでパケットをやりとるする機器
#     - VLANという仕組みで、ネットワークを論理的にサブネットに分割している
# - サブネットとは、L2が相互接続するされてできるネットワーク
# - ソケットとは「IPアドレス」と「ポート番号」の組のこと
#     - Linuxは様々なリソースを仮想的にファイルとして扱う
#         - stdout/in, CPU, TCP socket, etc... は全部仮想的なファイル
#     - ファイルディスクリプタの制限で、ソケットに同時接続できるクライアントの数が制限される
# - パケットは[宛先MACアドレス][送信元MACアドレス][宛先IPアドレス][送信元IPアドレス][データ]みたいに区切られてる
#     - MACアドレスはNICのポートごとに製造時に割り振られる
