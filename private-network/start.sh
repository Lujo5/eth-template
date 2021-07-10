#!/bin/bash

cd ./bnode && ./start.sh &
bnode_pid=$!

cd ./node1 && ./start.sh &
node1_pid=$!

cd ./node2 && ./start.sh &
node2_pid=$!

trap onexit INT
function onexit() {
  kill -9 $bnode_pid
  kill -9 $node1_pid
  kill -9 $node2_pid
}

wait