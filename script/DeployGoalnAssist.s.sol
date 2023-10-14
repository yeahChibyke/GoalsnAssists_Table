// SPDX-License-Identifier: MIT
pragma solidity >= 0.6.0 < 0.9.0;

import {Script} from "../lib/forge-std/src/Script.sol";
import {GoalnAssist} from "../src/GoalnAssist.sol";

contract DeployGoalnAssist is Script {
    function run() external returns (GoalnAssist) {
        vm.startBroadcast();
        GoalnAssist goalnAssist = new GoalnAssist();
        vm.stopBroadcast();
        return goalnAssist;
    }
}
