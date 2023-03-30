// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/LaunchPad.sol";

contract LaunchPadDeployer is Script {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    LaunchPad launchP;

    function run() public {
        vm.broadcast(deployerPrivateKey);
        launchP = new LaunchPad();
    }
}
