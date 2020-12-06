# aptコマンドは同時には実行できない
# => /var/lib/apt/lists/lock (lockファイルと呼ぶ) が存在しなければ実行、存在したら異常終了

for ((i=0; i<2; i++)) ; do taskset -c 0 ./count-1000.sh & done
# => クリティカルセクションが同時実行されるので、結果は2000にならない

# flockコマンドでアトミック操作を実現する => flock()というシステムコールを呼ぶ
for ((i=0; i<2; i++)) ; do taskset -c 0 ./correct-count-1000.sh & done 
# => これが排他制御にする仕組み
