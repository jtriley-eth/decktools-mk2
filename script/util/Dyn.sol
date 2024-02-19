// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

import { Mod } from "./Mod.sol";

library LibDyn {
    function toBytes4(bytes memory data) internal pure returns (bytes4 output) {
        if (data.length < 4) {
            return 0x00000000;
        }
        assembly {
            output := and(mload(add(data, 32)), shl(0xe0, 0xffffffff))
        }
    }

    function concat(bytes4[] memory lhs, bytes4[] memory rhs) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](lhs.length + rhs.length);
        uint256 k;
        for (uint256 i; i < lhs.length; i++) {
            output[k++] = lhs[i];
        }
        for (uint256 i; i < rhs.length; i++) {
            output[k++] = rhs[i];
        }
    }

    function toDynamic(bytes4[1] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](1);
        output[0] = input[0];
    }

    function toDynamic(bytes4[2] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](2);
        output[0] = input[0];
        output[1] = input[1];
    }

    function toDynamic(bytes4[3] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](3);
        output[0] = input[0];
        output[1] = input[1];
        output[2] = input[2];
    }

    function toDynamic(bytes4[4] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](4);
        for (uint256 i; i < 4; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes4[5] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](5);
        for (uint256 i; i < 5; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes4[6] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](6);
        for (uint256 i; i < 6; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes4[7] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](7);
        for (uint256 i; i < 7; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes4[8] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](8);
        for (uint256 i; i < 8; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes4[9] memory input) internal pure returns (bytes4[] memory output) {
        output = new bytes4[](9);
        for (uint256 i; i < 9; i++) {
            output[i] = input[i];
        }
    }

    function concat(address[] memory lhs, address[] memory rhs) internal pure returns (address[] memory output) {
        output = new address[](lhs.length + rhs.length);
        uint256 k;
        for (uint256 i; i < lhs.length; i++) {
            output[k++] = lhs[i];
        }
        for (uint256 i; i < rhs.length; i++) {
            output[k++] = rhs[i];
        }
    }

    function toDynamic(address[1] memory input) internal pure returns (address[] memory output) {
        output = new address[](1);
        output[0] = input[0];
    }

    function toDynamic(address[2] memory input) internal pure returns (address[] memory output) {
        output = new address[](2);
        output[0] = input[0];
        output[1] = input[1];
    }

    function toDynamic(address[3] memory input) internal pure returns (address[] memory output) {
        output = new address[](3);
        output[0] = input[0];
        output[1] = input[1];
        output[2] = input[2];
    }

    function toDynamic(address[4] memory input) internal pure returns (address[] memory output) {
        output = new address[](4);
        for (uint256 i; i < 4; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(address[5] memory input) internal pure returns (address[] memory output) {
        output = new address[](5);
        for (uint256 i; i < 5; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(address[6] memory input) internal pure returns (address[] memory output) {
        output = new address[](6);
        for (uint256 i; i < 6; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(address[7] memory input) internal pure returns (address[] memory output) {
        output = new address[](7);
        for (uint256 i; i < 7; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(address[8] memory input) internal pure returns (address[] memory output) {
        output = new address[](8);
        for (uint256 i; i < 8; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(address[9] memory input) internal pure returns (address[] memory output) {
        output = new address[](9);
        for (uint256 i; i < 9; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(uint256[1] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](1);
        output[0] = input[0];
    }

    function toDynamic(uint256[2] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](2);
        output[0] = input[0];
        output[1] = input[1];
    }

    function toDynamic(uint256[3] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](3);
        output[0] = input[0];
        output[1] = input[1];
        output[2] = input[2];
    }

    function toDynamic(uint256[4] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](4);
        for (uint256 i; i < 4; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(uint256[5] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](5);
        for (uint256 i; i < 5; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(uint256[6] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](6);
        for (uint256 i; i < 6; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(uint256[7] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](7);
        for (uint256 i; i < 7; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(uint256[8] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](8);
        for (uint256 i; i < 8; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(uint256[9] memory input) internal pure returns (uint256[] memory output) {
        output = new uint256[](9);
        for (uint256 i; i < 9; i++) {
            output[i] = input[i];
        }
    }

    function sum(uint256[] memory input) internal pure returns (uint256 output) {
        for (uint256 i; i < input.length; i++) {
            output += input[i];
        }
    }

    function toDynamic(bytes[1] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](1);
        output[0] = input[0];
    }

    function toDynamic(bytes[2] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](2);
        output[0] = input[0];
        output[1] = input[1];
    }

    function toDynamic(bytes[3] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](3);
        output[0] = input[0];
        output[1] = input[1];
        output[2] = input[2];
    }

    function toDynamic(bytes[4] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](4);
        for (uint256 i; i < 4; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes[5] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](5);
        for (uint256 i; i < 5; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes[6] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](6);
        for (uint256 i; i < 6; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes[7] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](7);
        for (uint256 i; i < 7; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes[8] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](8);
        for (uint256 i; i < 8; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(bytes[9] memory input) internal pure returns (bytes[] memory output) {
        output = new bytes[](9);
        for (uint256 i; i < 9; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(Mod[1] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](1);
        output[0] = input[0];
    }

    function toDynamic(Mod[2] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](2);
        output[0] = input[0];
        output[1] = input[1];
    }

    function toDynamic(Mod[3] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](3);
        output[0] = input[0];
        output[1] = input[1];
        output[2] = input[2];
    }

    function toDynamic(Mod[4] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](4);
        for (uint256 i; i < 4; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(Mod[5] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](5);
        for (uint256 i; i < 5; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(Mod[6] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](6);
        for (uint256 i; i < 6; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(Mod[7] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](7);
        for (uint256 i; i < 7; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(Mod[8] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](8);
        for (uint256 i; i < 8; i++) {
            output[i] = input[i];
        }
    }

    function toDynamic(Mod[9] memory input) internal pure returns (Mod[] memory output) {
        output = new Mod[](9);
        for (uint256 i; i < 9; i++) {
            output[i] = input[i];
        }
    }
}
