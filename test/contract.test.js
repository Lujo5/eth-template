const Contract = artifacts.require('./Contract.sol');
const assert = require("chai").assert;

contract('Contract', (accounts) => {
  const ownerAccount = accounts[0];

  it('should check that contract is deployed by owner', async () => {
    const instance = await Contract.deployed();

    let result = await instance.owner.call({from: ownerAccount});
    assert.equal(result.valueOf(), ownerAccount, 'Contract is not initialized');
  });

});
