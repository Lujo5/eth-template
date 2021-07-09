#!/bin/bash

enode_path=${BOOTNODE_ENODE_PATH:-"../bnode/enode.txt"}
bootnode_host="${BOOTNODE_HOST:-"127.0.0.1"}"
bootnode_port="${BOOTNODE_PORT:-"30301"}"

node_pnetwork_id="${NODE_NETWORK_ID:-"12345"}"
node_port="${NODE_PORT:-"30304"}"
node_rpc_port="${NODE_RPC_PORT:-"8546"}"
node_mine="${NODE_MINE:-"NO"}"

mine_arg="--mine"

if [ ! "$node_mine" = "YES" ]
then
  mine_arg=
fi

if [ ! -f "$enode_path" ]
then
  echo "Cannot start client: $enode_path does not exist"
  exit
fi

enode_key=$(<"$enode_path")
enode_url="enode://$enode_key@$bootnode_host:0?discport=$bootnode_port"

account=$(<./data/account.txt)

geth --networkid "$node_pnetwork_id" $mine_arg --datadir "./data" --port "$node_port" --ipcdisable --syncmode full --rpc --rpccorsdomain "*" --rpcport "$node_rpc_port" --allow-insecure-unlock --unlock "$account" --password "./password.txt" --bootnodes "$enode_url"