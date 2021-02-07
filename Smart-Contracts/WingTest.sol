pragma solidity ^0.5.0;

// import "./wingcoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract wingcoin is ERC20, ERC20Detailed, ERC20Mintable {
    constructor(
        string memory name,
        string memory symbol,
        uint initial_supply
    )
        ERC20Detailed(name, symbol, 18)
        public
    {
        // constructor can stay empty
    }
}


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
    
    using Counters for Counters.Counter;
    Counters.Counter token_ids;
    
        struct Detail {
        address beneficiary;
        uint amount_donated;
        uint count;
    }
        
    // Only permanent data that you would need to use within the smart contract later should be stored on-chain
    mapping(uint => Detail) public detail;
    
    // event Donation(uint count, string report_uri);
    
// , string memory token_uri
    function DonorInfo(address beneficiary, uint amount_donated, uint count) public payable returns(uint, uint) {
        amount_donated = msg.value;
        token_ids.increment();
        amount_donated = token_ids.current();
        count = token_ids.current();
        
        detail[count].count += 1;

        detail[count] = Detail(beneficiary, msg.value, count);
        // emit Donation(count, report_uri);
        return (amount_donated, detail[count].count);
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
        wingcoin token = new wingcoin(name, symbol, 0);
        token_address = address(token);
        
        wing1 token_sale = new wing1(1, token, wing_owner, cap, now, now + 2 minutes);
        token_sale_address = address(token_sale);
        
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}