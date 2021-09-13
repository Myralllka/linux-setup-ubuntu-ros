#!/bin/bash

current=$(sudo amixer sget PCM | grep 'Right:' | awk -F'[][]' '{ print $2 }' | sed 's/.$//' )

if [[ ! $current == '0' ]]; then
	new="$(expr $current - '10')"
else
	new=$current
fi

sudo amixer set PCM "$new%"

