go build -o test-x86_64 sample.go
GOARCH=arm go build -o test-arm sample.go 

file test-x86_64
file test-arm
# => you can see the CPU architecture at the first part of the file

objdump -d test-x86_64 | less
# => you can see assembly by this command, different from arm one

