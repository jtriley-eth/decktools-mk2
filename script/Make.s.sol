// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { DeckHub } from "../lib/ether-deck-mk2/src/DeckHub.sol";
import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibConst } from "./util/Const.sol";

contract MakeScript is Script {
    DeckHub internal hub;

    // -- overwrite
    address internal runner;
    bytes32 internal salt;

    function run() public {
        console2.log(LibConst.HEADER, LibConst.BAR);
        vm.startBroadcast();

        address deck = hub.deploy(runner, salt);

        vm.stopBroadcast();
        console2.log(LibConst.DEPLOYED_TO);
        console2.log(unicode"() → Ξ", deck);
        console2.log(LibConst.BAR);
    }
}
