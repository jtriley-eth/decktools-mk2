// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

// import { DeckRegistry } from "../lib/ether-deck-mk2/src/DeckRegistry.sol";
import { EtherDeckMk2 } from "../lib/ether-deck-mk2/src/EtherDeckMk2.sol";
import { ModRegistry } from "../lib/ether-deck-mk2/src/ModRegistry.sol";

contract DeckRegistry {
    mapping(address => address) public deployer;
    constructor(address) {}
    function deploy(address) public pure returns (address) {}
}

contract Genesis {
    constructor(address creator) {
        DeckRegistry registry = new DeckRegistry(address(this));

        registry.deploy(creator);

        selfdestruct(payable(0));
    }
}
