// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

interface Receiver {
    function onERC721Received(address, address, uint256, bytes calldata) external returns (bytes4);
    function onERC1155Received(address, address, uint256, uint256, bytes calldata) external returns (bytes4);
    function onERC1155BatchReceived(
        address,
        address,
        uint256[] calldata,
        uint256[] calldata,
        bytes calldata
    ) external returns (bytes4);
}
