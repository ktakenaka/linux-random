# "sleep" command exec "nanosleep()" system call, you can check "log.txt"
# "sleep" command waint until AT LEAST *req seconds
strace -o log.txt sleep 1

# exec infinte loop process a lot and confirm if it's being executed
for ((i=0;i<1000;i++)); do taskset -c 0 ./loop.sh & done
ps | wc -l

# I tried to confirm that "sleep" command sleep the process more than 1 second, but it failed...
# :) $ time taskset -c 0 sleep 1                                                                                                                                                                         (linux-cpu)
# zsh: job table full
# vcs_info:23: job table full or recursion limit exceeded      

# bulk delete the infinite loop processes
pgrep loop | xargs kill -9
