#!/bin/bash

wget http://xplanetclouds.com/free/local/clouds_2048.jpg -O /tmp/clouds_2048.jpg

grep download /tmp/clouds_2048.jpg
if [ $? -eq 0 ]
then
	exit
fi

convert /tmp/clouds_2048.jpg -resize 21600x10800 /tmp/clouds.jpg
