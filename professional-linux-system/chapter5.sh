# Linux internal structure
# 5.1 Process management
# LinuxのProcessには、シグナルを送ることで、終了とか停止とかできるけど、KILLってその中の一つで、強制終了のシグナル
# ちなみにSTOP・CONTで、一時停止・復帰もできるぞ

# プログラムには各シグナルに応じたシグナルハンドラ-が実装されている場合があって、kill -9はそれを無視して終了させるので本来ならば
kill -15 # を先にするのが望ましい
# ちなみに kill ってプロセスにシグナルを送るコマンドだから忘れないように、決してプロセスを殺すコマンドじゃないので

ps -ef
ps aux

# LinuxではPPIDが1のsystemdが最初に起動して、その後のProcessはこいつからfolkされてくぞ

# CPU時間の割り当てを変更したいときにはNiceレベルを調節
nice -n -5 gzip hoge.txt # gzip hoge.txtをNiceレベル -5 で実行
renice 10 2020 # PPID 2020のNiceレベルを10に変更

ulimit -Sa
ulimit -Hc 2048
ulimit -Ha

free -h
