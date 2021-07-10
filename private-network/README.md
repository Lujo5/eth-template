# eth-private-network
> Setup scripts and files for ethereum private network using Proof of Authority (Clique)

## Requirments
- Installed geth and bootnode ethereum tools (https://geth.ethereum.org/downloads) and added to path
- Bash shell terminal

## Setup
1. (optional) Change initial accounts passwords in ./node1/password.txt and ./node2/password.txt files
2. Execute `./setup.sh`

## Running Ethereum nodes
1. Execute `./bnode/start.sh`
2. Execute `./node1/start.sh`
3. Execute `./node2/start.sh`
4. (optional) To run all nodes in the same terminal execute `./start.sh`
5. (optional) To remove all private network data execute `./purge.sh`
