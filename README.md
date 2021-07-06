# eth-template
> Bootstrapped Ethereum smart contract project template with truffle and ganache

## Requirements
1. Installed npm packages `npm install`
2. IDE with solidity language support
3. (optional) Ethereum client (e.g. geth) for mainnet or testnet deployment

## Directories
- **contracts** - All the solidity contracts source code, with initial Migrations.sol used by truffle framework
- **migrations** - Add migration scripts that are executed by truffle "migrate" command
- **scripts** - Useful sandbox scripts as integration tests for deployed contracts on Ethereum network (mainnet or one of testnets)
- **tests** - JavaScript test files executed by truffle "test" command, using mocha and chai libraries to test the main logic and behavior of smart contracts

## Development steps
0. Configure local development environmnet and other Ethereum networks configuration in _truffle-config.js_ file
1. Write smart contracts in _./contracts_ directory
2. Compile contracts with command `npm run compile`
3. Add new migration file or add deployment of new contracts in existing migration file in _./migrations_ directory   
3. Write tests in _./tests_ directory
4. Run tests together with ganache-cli simulation network with command `npm run ganache-run-test` or run test on already running network node `npm run test`
5. (optional) Deploy contracts on any configured network using `npm run migrate`
6. (optional) Write additinal scripts to interact with smart contracts in _./scripts_ directory and execute them with command `truffle exec scripts/sample.js`
