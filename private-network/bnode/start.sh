#!/bin/bash

key_path=${BOOTNODE_KEY_PATH:-"boot.key"}
host="${BOOTNODE_HOST:-"127.0.0.1"}"
port="${BOOTNODE_PORT:-"30301"}"

if [ ! -f "$key_path" ]
then
  echo "Cannot start bootnode: $key_path does not exist"
  exit
fi

bootnode -nodekey "$key_path" -verbosity 5 -addr "$host:$port"