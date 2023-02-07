pragma solidity ^0.8.0;

contract DonateContract {

  uint totalDonations; 
  address payable receiver; 

  constructor(address _receiver) {
    receiver = payable (_receiver); 
  }

  function donate() public payable {
    (bool success,) = receiver.call{value: msg.value}("");
    require(success, "Failed to send money");
  }


  function getTotalDonations() view public returns(uint) {
    return totalDonations;
  }
}

contract DonateContractFactory {
    function createDonateContract(address _receiver) public returns (DonateContract) {
        DonateContract p = new DonateContract(_receiver);
        return p;
    }
}
