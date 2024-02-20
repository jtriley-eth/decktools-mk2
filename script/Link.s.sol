// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibDyn } from "./util/Dyn.sol";
import { Mod, LibMod } from "./util/Mod.sol";
import { LibConst } from "./util/Const.sol";

contract LinkScript is Script {
    using LibDyn for *;
    using LibMod for *;

    function run() public {
        EtherDeckMk2 deck = EtherDeckMk2(payable(vm.envAddress("DECK")));
        console2.log(LibConst.HEADER, LibConst.BAR);
        vm.startBroadcast();

        // -- overwrite
        Mod[] memory mods = [
            Mod.Bribe,
            Mod.Creator,
            Mod.Flash,
            Mod.Flatline,
            Mod.Receiver,
            Mod.Revoke,
            Mod.Storage,
            Mod.Transfer,
            Mod.TwoStepTransition
        ].toDynamic();

        (address[] memory addresses, bytes4[] memory selectors) = mods.toDispatchBatch();

        deck.setDispatchBatch(selectors, addresses);

        vm.stopBroadcast();
        console2.log(LibConst.MODS_LINKED);
        for (uint256 i; i < mods.length; i++) {
            console2.log(unicode"\tΞ ←", mods[i].toString());
        }
        console2.log(LibConst.BAR);
    }
}
