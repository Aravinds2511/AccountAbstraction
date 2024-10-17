// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MinimalAccount} from "src/Ethereum/MinimalAccount.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";

contract DeployMinimal is Script {
    function run() public {}

    function deployMinimalAccount() public returns (HelperConfig, MinimalAccount){
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();

        vm.startBroadcast(config.account);
        MinimalAccount minimalAccount = new MinimalAccount(config.entryPoint);
        minimalAccount.transferOwnership(config.account);
        vm.stopBroadcast();
        return (helperConfig, minimalAccount);
    }
}