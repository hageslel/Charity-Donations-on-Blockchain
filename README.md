Crowdfunding contract:

This contract is a different approach to the donation purposes. It has a cap on the maximum value that can be taken as donations and also time limit on the donation acceptance.

How this contract makes a difference:

1. The cap on the maximum amount that can be raised can be changed as per requirement of project.

2. The time limit in which the organization can accept the donations can be picked per requirement too.

3. The rate at which the token are generated depending on the amount of donations can be varied. Though this does not change the amount of donations made, it can create an impact among the donars as it changes the number of tokens they will receive after donation.

How the contract works:

1. A contract is created with the specifications of the token that will be distributed to the donars. The specifications include: ERC20, ERCDetailed, ERCMintable. This contract also generates initial supply of tokens.

2. This contract is then imported to the contract where the crowdsale is created. This file contains two contracts. One for deploying the coin and other to receive donations.

3. The coin deployer contract also has the minting function, which facilitates the minting of tokens to be distributed to donars.

4. As the crowdsale contract has the features of capped and timed crowdsale, these features can be determined while deploying the contract: while creating a new crowd sale.

Steps to deploy:

1. Deploy the coin deployer contract.

![Coin Deployer](Images/deployer-deploy-remix.PNG)

Metamask confirmation:

![Metamask transaction confirmation for deployment](Images/deployer-deploy-metamask.PNG)

2. Copy the token sale address from the deployer contract and run the address. As the crowdsale is token is saved in this address, any beneficiery will be able to then buy the tokens using the token sale contract.

![Sale contract deployment](Images/sale-deploy-remix.PNG)

3. Any beneficiery will be able to buy tokens at this point by donating any amouont that does not exceed the cap amount and if it is in the specific timeline when the contract is open.

![Buying token - Donating](Images/buy-tokens.PNG)

4. Once the cap is reached, the change in the flags can be noticed.

![Crowdsale completed - Donation maximum reached or time line reached](Images/Status.PNG)
