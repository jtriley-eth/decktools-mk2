// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Script } from "../../lib/forge-std/src/Script.sol";

import { DeckRegistry } from "../../lib/ether-deck-mk2/src/DeckRegistry.sol";

contract __Genesis {
    constructor(address creator) {
        DeckRegistry registry = new DeckRegistry(address(this));

        registry.deploy(creator);

        selfdestruct(payable(0));
    }
}

contract GenesisScript is Script {
    function run() public {
        uint256 pk = vm.envUint("PK");

        vm.startBroadcast(pk);

        new __Genesis(vm.addr(pk));

        vm.stopBroadcast();
    }
}
