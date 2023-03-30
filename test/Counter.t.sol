// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/LaunchPad.sol";

contract LauchPadTest is Test {
    LaunchPad public launchP;

    address owner = mkaddr("owner");

    function setUp() public {
        vm.startPrank(owner);
        launchP = new LaunchPad();
    }

    function testSetTokenDistribution() public {
        launchP.setTokenDistribution(20);
        launchP.startSales();
    }

    function mkaddr(string memory name) public returns (address) {
        address addr = address(
            uint160(uint256(keccak256(abi.encodePacked(name))))
        );
        vm.label(addr, name);
        return addr;
    }
}
