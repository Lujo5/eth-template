const Contract = artifacts.require('./Contract.sol');

module.exports = async (cb) => {
  const instance = await Contract.deployed();

  let owner = await instance.owner.call();
  console.log('Owner of contract:', owner);

  let accounts = await web3.eth.getAccounts();
  console.log('All accounts:', accounts);

  cb();
};
