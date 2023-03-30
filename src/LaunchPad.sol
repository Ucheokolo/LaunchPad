// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "lib/openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract LaunchPad is ERC20 {
    address owner;
    uint private totalPoolToken = 20 ether;
    address[] public lauchpadParticipants;
    uint public minimumAmt = 0.1 ether;

    struct launchDetails {
        uint startTime;
        uint duration;
        uint endLaunch;
        bool inProgress;
    }

    constructor() ERC20("Ogeni", "OGN") {
        owner = msg.sender;
    }

    launchDetails public launchpad;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can start Launchpad");
        _;
    }

    function startSales() public onlyOwner {
        launchDetails memory _launch = launchDetails(
            block.timestamp,
            3 minutes,
            block.timestamp + 3 minutes,
            true
        );

        launchpad = _launch;
    }

    function launchDeposit() public payable {
        require(msg.value > 0, "Insufficient particitpation fund");
        require(msg.sender != address(0), "Address zero!!!!");
        require(totalPoolToken > 0, "launchPad token exhausted");
        require(
            msg.value <= totalPoolToken,
            "Not enough tokens left, consider reducing purchase amount"
        );
        require(launchpad.inProgress == true, "LauchPad ended");

        uint transferAmt = tokenEquivalent();
        _mint(msg.sender, transferAmt);
        _totalSupply += transferAmt;
    }

    function tokenEquivalent() internal returns (uint) {
        uint equiAmt = msg.value * 1;
    }
}
