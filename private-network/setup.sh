#!/bin/bash

genesis_config=${GENESIS_CONFIG:-"./genesis.json"}
bootnode_key_path=${BOOTNODE_KEY_PATH:-"./bnode/boot.key"}
bootnode_enode_path=${BOOTNODE_ENODE_PATH:-"./bnode/enode.txt"}

if [ -f "$genesis_config" ]
then
  echo "Private network is already configured with file: $genesis_config"
  exit
fi

# Initialize accounts
echo "Creating initial accounts for each node..."
account1=$(geth --datadir ./node1/data account new --password "./node1/password.txt" | sed -n 's/.*Public address of the key:   0x\(.*\).*/\1/p')
echo "$account1" > ./node1/data/account.txt
echo "Account created: $account1"

account2=$(geth --datadir ./node2/data account new --password "./node2/password.txt" | sed -n 's/.*Public address of the key:   0x\(.*\).*/\1/p')
echo "$account2" > ./node2/data/account.txt
echo "Account created: $account2"


# Create config from template and prefill sealer and prepaid accounts
echo "Creating genesis configuration..."
cp genesis-template.json "$genesis_config"

sed -i "s/SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS/$account1/g" "$genesis_config"
sed -i "s/AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/$account2/g" "$genesis_config"


# Initialize bootnode key
if [ ! -f "$bootnode_key_path" ]
then
  echo "Generating bootnode key..."
  bootnode -genkey "$bootnode_key_path"
  boot_key=$(<"$bootnode_key_path")
  bootnode -nodekeyhex "$boot_key" -writeaddress > "$bootnode_enode_path"
  echo "Enode key saved to: $bootnode_enode_path"
else
  echo "Bootnode key already exists, enode file: $bootnode_enode_path"
fi

# Initialize nodes with config
echo "Initializing nodes with configuration..."
geth --datadir ./node1/data init "$genesis_config"
geth --datadir ./node2/data init "$genesis_config"
