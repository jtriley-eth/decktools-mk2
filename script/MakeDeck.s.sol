// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibConst } from "./util/Const.sol";

contract MakeDeckScript is Script {
    function run() public {
        console2.log(LibConst.HEADER, LibConst.BAR);
        vm.startBroadcast();

        EtherDeckMk2 deck = new EtherDeckMk2();

        vm.stopBroadcast();
        console2.log(LibConst.DEPLOYED_TO, address(deck));
        console2.log(LibConst.BAR);
    }
}
