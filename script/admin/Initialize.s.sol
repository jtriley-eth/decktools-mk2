// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../../lib/forge-std/src/Script.sol";

import { BribeMod } from "../../lib/ether-deck-mk2/src/mods/BribeMod.sol";
import { CreatorMod } from "../../lib/ether-deck-mk2/src/mods/CreatorMod.sol";
import { FlashMod } from "../../lib/ether-deck-mk2/src/mods/FlashMod.sol";
import { FlatlineMod } from "../../lib/ether-deck-mk2/src/mods/FlatlineMod.sol";
import { ReceiverMod } from "../../lib/ether-deck-mk2/src/mods/ReceiverMod.sol";
import { RevokeMod } from "../../lib/ether-deck-mk2/src/mods/RevokeMod.sol";
import { StorageMod } from "../../lib/ether-deck-mk2/src/mods/StorageMod.sol";
import { TransferMod } from "../../lib/ether-deck-mk2/src/mods/TransferMod.sol";
import { TwoStepTransitionMod } from "../../lib/ether-deck-mk2/src/mods/TwoStepTransitionMod.sol";

import { DeckHub } from "../../lib/ether-deck-mk2/src/DeckHub.sol";
import { ModRegistry } from "../../lib/ether-deck-mk2/src/ModRegistry.sol";
import { EtherDeckMk2 } from "../../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { IEtherDeckMk2 } from "../interfaces/IEtherDeckMk2.sol";
import { LibDyn } from "../util/Dyn.sol";
import { Mod, LibMod } from "../util/Mod.sol";

contract InitializeScript is Script {
    using LibDyn for *;

    // -- overwrite
    address initializer = address(0x00);
    bytes32 salt = bytes32(uint256(0x45));

    function run() public {
        require(initializer != address(0));
        vm.startBroadcast();

        DeckHub hub = new DeckHub();

        IEtherDeckMk2 deck = IEtherDeckMk2(hub.deploy(initializer, salt));

        deck.setDispatch(CreatorMod.create2.selector, address(new CreatorMod()));

        ModRegistry registry = ModRegistry(
            deck.create2(
                keccak256("Ether Deck Mk2"),
                0,
                abi.encodePacked(type(ModRegistry).creationCode, uint256(uint160(address(deck))))
            )
        );

        address[] memory targets = [
            address(registry),
            address(registry),
            address(registry),
            address(registry),
            address(registry),
            address(registry),
            address(registry),
            address(registry),
            address(registry)
        ].toDynamic();

        bytes[] memory payloads = [
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(BribeMod).creationCode), "BribeMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(CreatorMod).creationCode), "CreatorMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(FlashMod).creationCode), "FlashMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(FlatlineMod).creationCode), "FlatlineMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(ReceiverMod).creationCode), "ReceiverMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(RevokeMod).creationCode), "RevokeMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(StorageMod).creationCode), "StorageMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (deck.create2(keccak256("Ether Deck Mk2"), 0, type(TransferMod).creationCode), "TransferMod")
            ),
            abi.encodeCall(
                ModRegistry.register,
                (
                    deck.create2(keccak256("Ether Deck Mk2"), 0, type(TwoStepTransitionMod).creationCode),
                    "TwoStepTransitionMod"
                )
            )
        ].toDynamic();

        deck.runBatch(targets, new uint256[](9), payloads);

        deck.setDispatch(CreatorMod.create2.selector, address(0));

        vm.stopBroadcast();
    }
}
