# ERC20 Token Launchpad

## Smart Contract Test @ WEB3BRIDGE

### Contents

- Introduction
- Screen Shots
- Language
- Functions

### Introduction

This is a 4 hour smart contract test at web3bridge. This contract as it is named, simulates real world launchpads, where access is given to users to participate in a limited offer opportunity to purchase tokens for a discount price. Tokens are limited and auction ends when stipulated duration for sales has elapsed or all token has been purchased. If there are tokens left after sales, they are sent to address zero. During sales users immediately get the equivalent amount of token to the ether deposited into the contract. Money generated during sales are used to further improve the project.
Contract was successfully deployed and verified on Sepolia testnet.
You can interact with contract on [Contract Addres](https://sepolia.etherscan.io/address/0xcB25B01697dE2a20197df15b9b5Ad790535183A4).

### Screen Shots

##### Code Snippet

<img src="../launch_pad/images/code.png" style="width: 50%" alt="code">

##### Contract Verified

<img src="../launch_pad/images/verified.png" style="width: 50%" alt="verified">

##### Successful transaction

<img src="../launch_pad/images/deposite.png" style="width: 50%" alt="success">

##### Failed transaction

<img src="../launch_pad/images/end.png" style="width: 50%" alt="failed">

### Language

- Solidity

### Functions Calls

- setTokenDistribution()
- startSales()
- launchDeposit()
- retreiveFunds()

**_Functions not limited to the list above. See code file for the entirety_**
