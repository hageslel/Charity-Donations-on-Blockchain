## Welcome to our Charity Donations Project GitHub Page!

The goal of this project was to leverage blockchain technology to create a streamlined process for individuals to donate to desired founations.  By leveraging smart contracts donated funds can be tracked on the blockchain, providing visibility to donors of where their donations are being spent.  The grand scope of this project is to enhance donor contribution power and hold foundations accountable for their spending. 

### Research

[Charity Navigator](https://www.charitynavigator.org) was utilized to research charitable organizations and review organization ratings.  Numerous factors are considered when providing ratings, but the below outline provides a brief scope of the rankings:

  - A ranking of 4 means that more than 75% of the money raised goes to the program
  - A ranking of 3 means 66% or more of the money raised goes to the program
  - A ranking of 2 means 50% or more of the money raised goes to the program
  - A ranking of 1 means 33% or more of the money raised goes to the program
  - A ranking of 0 means 33% or less of the money raised goes to the program.
  
Following this research, we identified an opportunity to improve potential shortfalls of fund utilization, which will help organizations gain trust with donors. 

## Solutions: Smart Contracts
Two contracts were created for this project - one to allow direct donations to a desired charity, and another to deploy a crowdsale for donors to participate in to support a charity. 

The Donation_Portal contract accepts donations and distributes funds to set divisions within the charity.  Each division within the charity receives a percentage of each donation.  Percentages by division are defined when interacting with the contract.  An example of this contract in action is below.  

![Deposit Demo](depositCONTRACT.gif)

The wingcoin_deployer contract deploys capped crowdsale and gives donors the ability to purchase WING tokens.  This contract was created as an alternative use case to accept donations and possibly provide donors a stake (token) in the charity following their donation.  The Donation_Portal contract is the primary contract to support the project initative. An example of interation with this contract can be found in Resources folder. 

To enhance transparency and useability, a Python script was written to provide currency conversions.  This script accepts fiat currency codes (2 at a time) and outputs conversion rates of the top 10 cryptocurrencies.  The script assumes $1 inputs for each currency, with cryptocurrency conversions outputting accordingly.  An example of the script in action is below. 

![Currency Conversions](conversions_python2.gif)


- PROVIDE ROPSTEN LINKS
- MENTION HOW MORE DETAIL CAN BE FOUND IN CODE AND README OF GITHUB REPO
- POSSIBLY ADD CODE BLOCK SNIPIT IN MARKDOWN SECTION BELOW?



### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block


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


**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```


### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/hageslel/Charity-Donations-on-Blockchain/settings). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
