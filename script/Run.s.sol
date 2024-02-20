// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibDyn } from "./util/Dyn.sol";
import { LibConst } from "./util/Const.sol";

contract RunScript is Script {
    using LibDyn for *;

    function run() public {
        EtherDeckMk2 deck = EtherDeckMk2(payable(vm.envAddress("DECK")));
        console2.log(LibConst.HEADER, LibConst.BAR);
        vm.startBroadcast();

        address target;
        uint256 value;
        bytes memory payload;

        deck.run{ value: value }(target, payload);

        vm.stopBroadcast();
        console2.log(LibConst.ACTIONS_TAKEN);
        console2.log(unicode"\nΞ →", target);
        console2.logBytes(payload);
        console2.log(LibConst.BAR);
    }
}
