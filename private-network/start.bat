@echo off
START "BOOTNODE" cmd /k "cd ./bnode & bash start.sh"
START "NODE 1" cmd /k "cd ./node1 & bash start.sh"
START "NODE 2" cmd /k "cd ./node2 & bash start.sh"