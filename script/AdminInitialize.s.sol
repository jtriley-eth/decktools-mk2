// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { BribeMod } from "../../lib/ether-deck-mk2/src/mods/BribeMod.sol";
import { CreatorMod } from "../../lib/ether-deck-mk2/src/mods/CreatorMod.sol";
import { FlashMod } from "../../lib/ether-deck-mk2/src/mods/FlashMod.sol";
import { FlatlineMod } from "../../lib/ether-deck-mk2/src/mods/FlatlineMod.sol";
import { ReceiverMod } from "../../lib/ether-deck-mk2/src/mods/ReceiverMod.sol";
import { RevokeMod } from "../../lib/ether-deck-mk2/src/mods/RevokeMod.sol";
import { StorageMod } from "../../lib/ether-deck-mk2/src/mods/StorageMod.sol";
import { TransferMod } from "../../lib/ether-deck-mk2/src/mods/TransferMod.sol";
import { TwoStepTransitionMod } from "../../lib/ether-deck-mk2/src/mods/TwoStepTransitionMod.sol";

import { ModRegistry } from "../lib/ether-deck-mk2/src/ModRegistry.sol";
import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibDyn } from "./util/Dyn.sol";
import { Mod, LibMod } from "./util/Mod.sol";

contract AdminInitializeScript is Script {
    function run() public {
        vm.startBroadcast();

        EtherDeckMk2 deck = new EtherDeckMk2();
        ModRegistry registry = new ModRegistry(address(deck));
        deck.setDispatch(CreatorMod.create2.selector, address(new CreatorMod()));
        CreatorMod creatorDeck = CreatorMod(address(deck));

        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(BribeMod).creationCode),
            "BribeMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(CreatorMod).creationCode),
            "CreatorMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(FlashMod).creationCode),
            "FlashMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(FlatlineMod).creationCode),
            "FlatlineMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(ReceiverMod).creationCode),
            "ReceiverMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(RevokeMod).creationCode),
            "RevokeMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(StorageMod).creationCode),
            "StorageMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(TransferMod).creationCode),
            "TransferMod"
        );
        registry.register(
            creatorDeck.create2(keccak256("Ether Deck Mk2"), 0, type(TwoStepTransitionMod).creationCode),
            "TwoStepTransitionMod"
        );

        

        vm.stopBroadcast();
    }
}
