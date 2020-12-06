# CPUの可動状態を見る
# 1秒ごとにすべてのCPUの稼働状態をみている
# ちなみに "P" はprocessorの意味
sar -P ALL 1

# %idle: なんもしてないの意味
# %user: processが動いていた時間
# %nice: nice/reniceコマンドで優先度を下げたprocessが動いている時間（＊優先度が高いやつは %userにカウントされる）
# %system: kernelが動作中
# %iowait: cpuがidle状態で、io待ちが発生している

taskset -c 0 ./loop
sar -P 0 1
# => loopを動かしているので %user が100%になる

taskset -c 0 nice -n 1 ./loop
sar -P 0 1
# => nice コマンドで優先度を下げてloopさせているので、%niceが100%になる

 taskset -c 0 ./ppidloop
 sar -P 0 1
 # => getppidがkernelを呼ぶので、%systemと%userが上がる


