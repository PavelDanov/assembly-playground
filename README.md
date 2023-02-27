# x86assembly-playground

## Building on Linux or in WSL

```shell
as exit.s -o exit.o
ld exit.o -o exit

# with debug symbols
as exit.s -g -o exit.o
```

## Run & Debug

```shell
# run
./exit

# see result
echo $?

# use gdb to debug
gdb ./exit
```
