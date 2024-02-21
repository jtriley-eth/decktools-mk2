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

import { ModRegistry } from "../../lib/ether-deck-mk2/src/ModRegistry.sol";

import { LibConst } from "../util/Const.sol";

contract VibeCheck is Script {
    address internal bribeMod = address(0xA82706F72c8ca19C5aCBF93cddC9534A28B0ADF9);
    address internal creatorMod = address(0x131e34C36A8A581E06207a40A552f54f569E6580);
    address internal flashMod = address(0xa001CDa77c79dA06b9f74d23c78Ab9f68e2462AC);
    address internal flatlineMod = address(0x462b133D3E4C24c405DaCff1AA562b92D0fb47fD);
    address internal receiverMod = address(0x8b51C150d6899aa8efeD1E24D2489426c47C5653);
    address internal revokeMod = address(0x09f473F09bE2024B30c96D5C2D24A626aE053433);
    address internal storageMod = address(0xD82CF11f8DE80ca8107E60Fc188DB1448421D4E0);
    address internal transferMod = address(0x21D9B7e84c8acF01898a41Ad0C39dDc2b1226142);
    address internal twoStepTransitionMod = address(0xe8b77A455F73a09720b788274FbbF1BfBbb6057D);

    address internal deckHub = address(0xc691129F7235863c6b19d0Ac005142688a4D8502);
    ModRegistry internal registry = ModRegistry(address(0x2E79E8C87F496cD2D1fe0E32Fcfe945660501db3));

    function run() public view {
        console2.log(LibConst.HEADER, LibConst.BAR);
        console2.log("Vibe Check~");

        require(bribeMod == registry.searchByName("BribeMod"), "searchByName::BribeMod");
        require(creatorMod == registry.searchByName("CreatorMod"), "searchByName::CreatorMod");
        require(flashMod == registry.searchByName("FlashMod"), "searchByName::FlashMod");
        require(flatlineMod == registry.searchByName("FlatlineMod"), "searchByName::FlatlineMod");
        require(receiverMod == registry.searchByName("ReceiverMod"), "searchByName::ReceiverMod");
        require(revokeMod == registry.searchByName("RevokeMod"), "searchByName::RevokeMod");
        require(storageMod == registry.searchByName("StorageMod"), "searchByName::StorageMod");
        require(transferMod == registry.searchByName("TransferMod"), "searchByName::TransferMod");
        require(
            twoStepTransitionMod == registry.searchByName("TwoStepTransitionMod"), "searchByName::TwoStepTransitionMod"
        );

        require(
            keccak256("BribeMod") == keccak256(bytes(registry.searchByAddress(bribeMod))), "searchByAddress::BribeMod"
        );
        require(
            keccak256("CreatorMod") == keccak256(bytes(registry.searchByAddress(creatorMod))),
            "searchByAddress::CreatorMod"
        );
        require(
            keccak256("FlashMod") == keccak256(bytes(registry.searchByAddress(flashMod))), "searchByAddress::FlashMod"
        );
        require(
            keccak256("FlatlineMod") == keccak256(bytes(registry.searchByAddress(flatlineMod))),
            "searchByAddress::FlatlineMod"
        );
        require(
            keccak256("ReceiverMod") == keccak256(bytes(registry.searchByAddress(receiverMod))),
            "searchByAddress::ReceiverMod"
        );
        require(
            keccak256("RevokeMod") == keccak256(bytes(registry.searchByAddress(revokeMod))), "searchByAddress::RevokeMod"
        );
        require(
            keccak256("StorageMod") == keccak256(bytes(registry.searchByAddress(storageMod))),
            "searchByAddress::StorageMod"
        );
        require(
            keccak256("TransferMod") == keccak256(bytes(registry.searchByAddress(transferMod))),
            "searchByAddress::TransferMod"
        );
        require(
            keccak256("TwoStepTransitionMod") == keccak256(bytes(registry.searchByAddress(twoStepTransitionMod))),
            "searchByAddress::TwoStepTransitionMod"
        );

        console2.log(unicode"✅ success\n", LibConst.BAR);
    }
}
