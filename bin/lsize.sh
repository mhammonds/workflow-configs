#!/bin/bash
find $1 -xdev -type f -size +$2 | xargs -n 1 -I {} du -s {} | sort -n -r | cut -f 2 | xargs -n 1 -I {} du -sh {}
