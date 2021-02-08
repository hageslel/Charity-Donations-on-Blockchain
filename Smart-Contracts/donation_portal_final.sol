pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";


contract Donation_Portal {
    
  using Counters for Counters.Counter;
  Counters.Counter donated;

  address internal org_admin = msg.sender;
  uint public total_donations_received;
  uint public last_deposit_block;
  uint public last_deposit_amount;
  
  address public last_to_deposit;
  address payable mission;
  address payable investment;
  address payable marketing;
  address payable operations;
  address payable taxes;
  
  uint bd_1;
  uint bd_2;
  uint bd_3;
  uint bd_4;
  uint bd_5;
  
  uint points;
  uint amnt_mis;
  uint amnt_inv;
  uint amnt_mar;
  uint amnt_ope;
  uint amnt_tax;
  
  constructor(
      address payable _mission,
      address payable _investment,
      address payable _marketing,
      address payable _operations,
      address payable _taxes
  ) public {
    mission = _mission;
    investment = _investment;
    marketing = _marketing;
    operations = _operations;
    taxes = _taxes;
  }
  

      struct Data {
        address donor;
        uint count;
    }
    
    mapping(uint => Data) data;
    
    event Donation(uint donate, string report_uri);
    
    function set_pcts(
        uint _mission_pct, 
        uint _invest_pct, 
        uint _market_pct, 
        uint _operate_pct, 
        uint _tax_pct
        ) 
        public returns (uint, uint, uint, uint, uint) {
        require(msg.sender == org_admin, "Access Denied, you are not the appropriate owner");
        
        bd_1 = _mission_pct; 
        bd_2 = _invest_pct; 
        bd_3 = _market_pct; 
        bd_4 = _operate_pct; 
        bd_5 = _tax_pct;
        require(_mission_pct + _invest_pct + _market_pct + _operate_pct + _tax_pct == 100, "The sum of all percentages MUST equal 100 to continue");
        return (bd_1, bd_2, bd_3, bd_4, bd_5);
    }
    
    function deposit() public payable {
        
        total_donations_received = total_donations_received + msg.value;
        points = msg.value/100;
        
        amnt_mis = points * bd_1;
        amnt_inv = points * bd_2;
        amnt_mar = points * bd_3;
        amnt_ope = points * bd_4;
        amnt_tax = points * bd_5;
        
        mission.transfer(amnt_mis);
        investment.transfer(amnt_inv);
        marketing.transfer(amnt_mar);
        operations.transfer(amnt_ope);
        taxes.transfer(amnt_tax);
        
        last_to_deposit = msg.sender;
        last_deposit_amount = msg.value;
        last_deposit_block = block.number;
    }
    
    function() external payable {}
    
    function registerDonor(address donor) public returns(uint) {
        donated.increment();
        uint donate = donated.current();
        data[donate] = Data(donor, 0);
        return donate;
    }
    
    function reportDonation(uint donate, string memory report_uri) public returns(uint) {
        data[donate].count += 1;
        // Permanently associates the report_uri with the token_id on-chain via Events 
        // for a lower gas-cost than storing directly in the contract's storage.
        emit Donation(donate, report_uri);
        return data[donate].count;
    }
}