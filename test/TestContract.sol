// SPDX-License-Identifier: MIT
pragma solidity >=0.5 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Contract.sol";

contract TestContract {

  function testInitialContractCreation() public {
    Contract instance = Contract(DeployedAddresses.Contract());

    Assert.equal(instance.owner(), tx.origin, "Owner should be caller of this contract");
  }

}
