#!/bin/bash
# Plays the "Submarine" audio clip once a minute

while true; do
/usr/bin/afplay /System/Library/Sounds/Morse.aiff 
sleep 60
done
