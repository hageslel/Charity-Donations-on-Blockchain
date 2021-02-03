pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract Donation_Portal {
  address payable org_admin;
  address payable wing_admin;
  
  uint public balance;
  uint public last_withdraw_block;
  uint public last_withdraw_amount;
  address public last_to_withdraw;

  constructor(address payable _one, address payable _two) public {
    org_admin = _one;
    wing_admin = _two;
  }

  function withdraw(
      uint wei_amount,
      bool mission,
      bool investment,
      bool marketing,
      bool operations,
      bool taxes
      ) public {
    require(msg.sender == org_admin || msg.sender == wing_admin, "You don't own this account!");
    require(balance >= wei_amount);
    if (mission == true) {
        msg.sender.transfer(wei_amount);
        balance -= wei_amount;
    }
    
    if (investment == true) {
        msg.sender.transfer(wei_amount);
        balance -= wei_amount;
    }
    
    if (marketing == true) {
        msg.sender.transfer(wei_amount);
        balance -= wei_amount;
    }
    
    if (operations == true) {
        msg.sender.transfer(wei_amount);
        balance -= wei_amount;
    }
    
    if (taxes == true) {
        msg.sender.transfer(wei_amount);
        balance -= wei_amount;
    }

    if (last_to_withdraw != msg.sender) {
      last_to_withdraw = msg.sender;
    }

    last_withdraw_block = block.number;
    last_withdraw_amount = wei_amount;
    
    
  }

  function deposit() public payable {
      balance = address(this).balance;
  }
  
  

  function() external payable {}
}
