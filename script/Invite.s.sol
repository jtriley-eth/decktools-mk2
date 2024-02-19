// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script, console2 } from "../lib/forge-std/src/Script.sol";

import { DeckRegistry } from "../lib/ether-deck-mk2/src/DeckRegistry.sol";
import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";

import { LibConst } from "./util/Const.sol";

contract InviteScript is Script {
    address internal registry = address(0x00);

    // -- overwrite
    address internal invitee = address(0x00);

    function run() public {
        EtherDeckMk2 deck = EtherDeckMk2(payable(vm.envAddress("DECK")));
        console2.log(LibConst.HEADER, LibConst.BAR);
        vm.startBroadcast();

        require(invitee != address(0));

        deck.run(
            registry,
            abi.encodeCall(DeckRegistry.deploy, (invitee))
        );

        address deployment;
        assembly {
            returndatacopy(0x00, 0x00, 0x20)
            deployment := mload(0x00)
        }

        vm.stopBroadcast();
        console2.log(LibConst.DEPLOYED_TO, deployment);
        console2.log(LibConst.BAR);
    }
}
