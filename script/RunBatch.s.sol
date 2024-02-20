// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibDyn } from "./util/Dyn.sol";
import { LibConst } from "./util/Const.sol";

contract RunBatchScript is Script {
    using LibDyn for *;

    function run() public {
        EtherDeckMk2 deck = EtherDeckMk2(payable(vm.envAddress("DECK")));
        console2.log(LibConst.HEADER, LibConst.BAR);
        vm.startBroadcast();

        address[] memory targets = [address(0x01), address(0x02)].toDynamic();
        uint256[] memory values = [uint256(0), uint256(0)].toDynamic();
        bytes[] memory payloads = [bytes(hex"aabbccdd"), bytes(hex"eeff0011")].toDynamic();

        deck.runBatch{ value: values.sum() }(targets, values, payloads);

        vm.stopBroadcast();
        console2.log(LibConst.ACTIONS_TAKEN);
        for (uint256 i; i < targets.length; i++) {
            console2.log("\n>>>", targets[i], values[i]);
            console2.logBytes(payloads[i]);
        }
        console2.log(LibConst.BAR);
    }
}
