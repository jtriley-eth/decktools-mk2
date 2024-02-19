// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { BribeMod } from "../../lib/ether-deck-mk2/src/mods/BribeMod.sol";
import { CreatorMod } from "../../lib/ether-deck-mk2/src/mods/CreatorMod.sol";
import { FlashMod } from "../../lib/ether-deck-mk2/src/mods/FlashMod.sol";
import { FlatlineMod } from "../../lib/ether-deck-mk2/src/mods/FlatlineMod.sol";
import { ReceiverMod } from "../../lib/ether-deck-mk2/src/mods/ReceiverMod.sol";
import { RevokeMod } from "../../lib/ether-deck-mk2/src/mods/RevokeMod.sol";
import { StorageMod } from "../../lib/ether-deck-mk2/src/mods/StorageMod.sol";
import { TransferMod } from "../../lib/ether-deck-mk2/src/mods/TransferMod.sol";
import { TwoStepTransitionMod } from "../../lib/ether-deck-mk2/src/mods/TwoStepTransitionMod.sol";

import { Receiver } from "./Receiver.sol";
import { LibDyn } from "./Dyn.sol";

enum Mod {
    Bribe,
    Creator,
    Flash,
    Flatline,
    Receiver,
    Revoke,
    Storage,
    Transfer,
    TwoStepTransition
}

using LibMod for Mod global;

library LibMod {
    using LibDyn for *;

    function toAddress(Mod mod) internal pure returns (address) {
        if (mod == Mod.Bribe) return address(0x00);
        if (mod == Mod.Creator) return address(0x01);
        if (mod == Mod.Flash) return address(0x02);
        if (mod == Mod.Flatline) return address(0x03);
        if (mod == Mod.Receiver) return address(0x04);
        if (mod == Mod.Revoke) return address(0x05);
        if (mod == Mod.Storage) return address(0x06);
        if (mod == Mod.Transfer) return address(0x07);
        if (mod == Mod.TwoStepTransition) return address(0x08);
        revert("unreachable");
    }

    function toString(Mod mod) internal pure returns (string memory) {
        if (mod == Mod.Bribe) return "BribeMod";
        if (mod == Mod.Creator) return "CreatorMod";
        if (mod == Mod.Flash) return "FlashMod";
        if (mod == Mod.Flatline) return "FlatlineMod";
        if (mod == Mod.Receiver) return "ReceiverMod";
        if (mod == Mod.Revoke) return "RevokeMod";
        if (mod == Mod.Storage) return "StorageMod";
        if (mod == Mod.Transfer) return "TransferMod";
        if (mod == Mod.TwoStepTransition) return "TwoStepTransitionMod";
        revert("unreachable");
    }

    function toDispatchBatch(Mod[] memory mods) internal pure returns (address[] memory, bytes4[] memory) {
        address[] memory modAddresses;
        bytes4[] memory modSelectors;

        for (uint256 i; i < mods.length; i++) {
            (address[] memory addresses, bytes4[] memory selectors) = toDispatch(mods[i]);
            modAddresses = modAddresses.concat(addresses);
            modSelectors = modSelectors.concat(selectors);
        }

        return (modAddresses, modSelectors);
    }

    function toDispatch(Mod mod) internal pure returns (address[] memory, bytes4[] memory) {
        address modAddress = mod.toAddress();

        if (mod == Mod.Bribe) {
            return (
                [modAddress, modAddress, modAddress].toDynamic(),
                [BribeMod.nonce.selector, BribeMod.bribeBuilder.selector, BribeMod.bribeCaller.selector].toDynamic()
            );
        }

        if (mod == Mod.Creator) {
            return (
                [modAddress, modAddress, modAddress].toDynamic(),
                [CreatorMod.create.selector, CreatorMod.create2.selector, CreatorMod.compute2.selector].toDynamic()
            );
        }

        if (mod == Mod.Flash) {
            return (
                [modAddress, modAddress, modAddress, modAddress].toDynamic(),
                [
                    FlashMod.setFlashFeeFactor.selector,
                    FlashMod.maxFlashLoan.selector,
                    FlashMod.flashFee.selector,
                    FlashMod.flashLoan.selector
                ].toDynamic()
            );
        }

        if (mod == Mod.Flatline) {
            return (
                [modAddress, modAddress, modAddress].toDynamic(),
                [FlatlineMod.setContingency.selector, FlatlineMod.checkIn.selector, FlatlineMod.contingency.selector]
                    .toDynamic()
            );
        }

        if (mod == Mod.Receiver) {
            return (
                [modAddress, modAddress, modAddress].toDynamic(),
                [
                    Receiver.onERC721Received.selector,
                    Receiver.onERC1155Received.selector,
                    Receiver.onERC1155BatchReceived.selector
                ].toDynamic()
            );
        }

        if (mod == Mod.Revoke) {
            return (
                [modAddress, modAddress, modAddress, modAddress, modAddress].toDynamic(),
                [
                    RevokeMod.revokeERC20Approval.selector,
                    RevokeMod.revokeERC721Approval.selector,
                    RevokeMod.revokeERC6909Approval.selector,
                    RevokeMod.revokeApprovalForAll.selector,
                    RevokeMod.revokeOperator.selector
                ].toDynamic()
            );
        }

        if (mod == Mod.Storage) {
            return (
                [modAddress, modAddress].toDynamic(), [StorageMod.write.selector, StorageMod.read.selector].toDynamic()
            );
        }

        if (mod == Mod.Transfer) {
            return (
                [modAddress, modAddress, modAddress, modAddress, modAddress].toDynamic(),
                [
                    TransferMod.transferEther.selector,
                    TransferMod.transferERC20.selector,
                    TransferMod.transferERC721.selector,
                    TransferMod.transferERC1155.selector,
                    TransferMod.transferERC6909.selector
                ].toDynamic()
            );
        }

        if (mod == Mod.TwoStepTransition) {
            return (
                [modAddress, modAddress].toDynamic(),
                [
                    TwoStepTransitionMod.startRunnerTransition.selector,
                    TwoStepTransitionMod.acceptRunnerTransition.selector
                ].toDynamic()
            );
        }
        revert("unreachable");
    }
}
