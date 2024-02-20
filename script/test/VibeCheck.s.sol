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
    address internal bribeMod = address(0x311E92C63C77f17DbA53694e0e28Bb83ad95A577);
    address internal creatorMod = address(0x85098d38a7ecB80597de67f787C7697CB40dCd47);
    address internal flashMod = address(0x51d21D1987F66aBFDD2142eC341F030B4C0D29f3);
    address internal flatlineMod = address(0xd584573a6E0b99c991ABE9b22835Ef53601CA008);
    address internal receiverMod = address(0xbc7Ee6c99a5B6dC22AFB16d36916e5c70CA2FA0d);
    address internal revokeMod = address(0x1F2AD1fa2b0F5ac4886397b536E60586bd6B015c);
    address internal storageMod = address(0x65cE3Fdc88eCD8DD876c6BFe1b708EE3b3f7B29a);
    address internal transferMod = address(0xB71FFF450dB7f1E84476d4CAc6ADf4BB77B7dA9b);
    address internal twoStepTransitionMod = address(0xB323B07454f366a4d2257d3D84eB41F685C83FeA);

    address internal deckHub = address(0x5FbDB2315678afecb367f032d93F642f64180aa3);
    address internal deck = address(0xe79729BB92e5b5ea7eb30eA7adF9B186598bCD7D);

    ModRegistry internal registry = ModRegistry(address(0x6f985Fb41b6DCBCC9599d1e0D37A7E77a984363A));

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
