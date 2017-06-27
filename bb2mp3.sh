#!/bin/bash

read -p "Enter expression: " BB
read -p "Enter time in seconds: " T
S=$[T*8000]
echo $S
echo "int main(){for(int t=0;;t++){putchar($BB);}}"|gcc -xc -
./a.out|head -c $S|ffmpeg -f u8 -ar 8000 -i pipe: -b:a 128k o.mp3
rm a.out
