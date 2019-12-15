#!bin/bash

# xargs -a files-to-moving-from-1-to-2.txt mv -t ${PWD}/folder-2

sed -e "s/^/${PWD//\//\\/}\/folder-1\//" files-to-moving-from-1-to-2.txt | xargs mv -t ${PWD}/folder-2
