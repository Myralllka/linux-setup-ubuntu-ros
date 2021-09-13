#!/bin/bash

current=$(sudo amixer sget PCM | grep 'Right:' | awk -F'[][]' '{ print $2 }' | sed 's/.$//' )

if [[ $current == 0 ]]; then
	char=" muted"
elif [[ $current -le 33 ]]; then
	output=" $current%"
elif [[ $current -le 66 ]]; then
	output=" $current%"
else 
	output=" $current%"
fi

echo $output

sudo amixer set PCM "$current%"

