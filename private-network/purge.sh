#!/bin/bash

genesis_config=${GENESIS_CONFIG:-"./genesis.json"}
bootnode_key_path=${BOOTNODE_KEY_PATH:-"./bnode/boot.key"}
bootnode_enode_path=${BOOTNODE_ENODE_PATH:-"./bnode/enode.txt"}

read -p "Are you sure that you want to purge all private network data? (y/n): " -n 1 -r
echo    # move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  exit 1
fi

# Removing bootnode data
if [ -f "$bootnode_key_path" ]
then
  rm "$bootnode_key_path"
  echo "Removed $bootnode_key_path file"
fi
if [ -f "$bootnode_enode_path" ]
then
  rm "$bootnode_enode_path"
  echo "Removed $bootnode_enode_path file"
fi

# Removing node1 data
if [ -d ./node1/data/geth ]
then
  rm -rf ./node1/data/geth
  echo "Removed node1 geth data"
fi
if [ -d ./node1/data/keystore ]
then
  rm -rf ./node1/data/keystore
  echo "Removed node1 keystore data"
fi
if [ -f ./node1/data/account.txt ]
then
  rm ./node1/data/account.txt
  echo "Removed node1 account.txt file"
fi

# Removing node2 data
if [ -d ./node2/data/geth ]
then
  rm -rf ./node2/data/geth
  echo "Removed node2 geth data"
fi
if [ -d ./node2/data/keystore ]
then
  rm -rf ./node2/data/keystore
  echo "Removed node2 keystore data"
fi
if [ -f ./node2/data/account.txt ]
then
  rm ./node2/data/account.txt
  echo "Removed node2 account.txt file"
fi

# Removing genesis.json file
if [ -f "$genesis_config" ]
then
  rm "$genesis_config"
  echo "Removed genesis.json file"
fi

echo "All private network data purged successfully"
