// SPDX-License-Identifier: BSD-3-Clause-Clear
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {IrisClassifier} from "../src/IrisClassifier.sol";

contract Deploy is Script {
    function run() public {
        // Setup wallet
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        // Log address
        address deployerAddress = vm.addr(deployerPrivateKey);
        console2.log("Loaded deployer: ", deployerAddress);

        address registry = 0x663F3ad617193148711d28f5334eE4Ed07016602;
        // Create consumer
        IrisClassifier classifier = new IrisClassifier(registry);
        console2.log("Deployed IrisClassifier: ", address(classifier));

        // Execute
        vm.stopBroadcast();
        vm.broadcast();
    }
}
