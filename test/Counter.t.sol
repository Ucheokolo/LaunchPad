// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/LaunchPad.sol";

contract LauchPadTest is Test {
    LaunchPad public launchP;

    address owner = mkaddr("owner");

    address participant1 = mkaddr("partticipant1");
    address participant2 = mkaddr("partticipant2");
    address participant3 = mkaddr("partticipant3");
    address participant4 = mkaddr("partticipant4");

    function setUp() public {
        vm.startPrank(owner);
        launchP = new LaunchPad();
    }

    function testSetTokenDistribution() public {
        launchP.setTokenDistribution(20);
        launchP.startSales();
    }

    function testLaunchDeposit() public {
        vm.deal(participant1, 20 ether);
        vm.deal(participant2, 20 ether);
        vm.deal(participant3, 20 ether);
        vm.deal(participant4, 20 ether);
        testSetTokenDistribution();
        vm.stopPrank();

        vm.prank(participant1);
        launchP.launchDeposit{value: 0.5 ether}();

        launchP.totalSupply();
        vm.warp(2 minutes);

        vm.prank(participant2);
        launchP.launchDeposit{value: 9 ether}();
        launchP.totalSupply();
    }

    function mkaddr(string memory name) public returns (address) {
        address addr = address(
            uint160(uint256(keccak256(abi.encodePacked(name))))
        );
        vm.label(addr, name);
        return addr;
    }
}
