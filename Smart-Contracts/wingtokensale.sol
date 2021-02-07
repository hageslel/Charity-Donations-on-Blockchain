pragma solidity >=0.4.22 <0.6.0;

import "./wingcoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";

contract wing1 is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale {
    constructor( 
        uint rate,
        wingcoin token, // token name
        address payable wing_owner,
        uint cap,
        uint256 openingTime,
        uint256 closingTime
        )
        
        Crowdsale(rate, wing_owner, token)
        CappedCrowdsale(cap)
        TimedCrowdsale(openingTime, closingTime)
        
        public
        
    {
        
    }
}
    
contract wingcoin_deployer{
    address public token_sale_address;
    address public token_address;
    
    constructor(
        string memory name,
        string memory symbol,
        address payable wing_owner,
        uint256 cap
    ) public
    {
        wingcoin token = new wingcoin(name, symbol, 18);
        token_address = address(token);
        
        wing1 token_sale = new wing1(1, token, wing_owner, cap, now, now + 45 days);
        token_sale_address = address(token_sale);
        
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}