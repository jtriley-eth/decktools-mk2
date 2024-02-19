// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.24;

interface IEtherDeckMk2 {
    // -- core deck
    function dispatch(bytes4 selector) external view returns (address);
    function runner() external view returns (address);
    function run(address target, bytes calldata payload) external payable;
    function runBatch(
        address[] calldata targets,
        uint256[] calldata values,
        bytes[] calldata payloads
    ) external payable;
    function setDispatch(bytes4 selector, address target) external;
    function setDispatchBatch(bytes4[] calldata selectors, address[] calldata targets) external;

    // -- bribe mod
    function nonce() external view returns (uint256);
    function bribeBuilder(address target, bytes calldata payload, uint256 bribe) external payable;
    function bribeCaller(address target, bytes calldata payload, uint256 bribe) external payable;

    // -- creator mod
    function create(uint256 value, bytes calldata initcode) external payable returns (address);
    function create2(bytes32 salt, uint256 value, bytes calldata initcode) external payable returns (address);
    function compute2(bytes32 salt, bytes calldata initcode) external view returns (address);

    // -- flash mod
    function setFlashFeeFactor(address token, uint256 factor) external;
    function maxFlashLoan(address token) external view returns (uint256);
    function flashFee(address token, uint256 amount) external view returns (uint256);
    function flashLoan(address token, uint256 amount, bytes calldata payload) external;

    // -- flatline mod
    function setContingency(address receiver, uint32 interval) external;
    function checkIn() external;
    function contingency() external;

    // -- revoke mod
    function revokeERC20Approval(address[] calldata tokens, address[] calldata spenders) external;
    function revokeERC721Approval(address[] calldata tokens, uint256[] calldata ids) external;
    function revokeERC6909Approval(
        address[] calldata tokens,
        uint256[] calldata ids,
        address[] calldata operators
    ) external;
    function revokeApprovalForAll(address[] calldata tokens, address[] calldata operators) external;
    function revokeOperator(address[] calldata tokens, address[] calldata operators) external;

    // -- storage mod
    function write(bytes32[] calldata slots, bytes32[] calldata values) external;
    function read(bytes32[] calldata slots) external view returns (bytes32[] memory);

    // -- transfer mod
    function transferEther(address[] calldata receivers, uint256[] calldata amounts) external payable;
    function transferERC20(
        address[] calldata tokens,
        address[] calldata receivers,
        uint256[] calldata amounts
    ) external;
    function transferERC721(address[] calldata tokens, address[] calldata receivers, uint256[] calldata ids) external;
    function transferERC1155(
        address[] calldata tokens,
        address[] calldata receivers,
        uint256[] calldata ids,
        uint256[] calldata amounts
    ) external;
    function transferERC6909(
        address[] calldata tokens,
        address[] calldata receivers,
        uint256[] calldata ids,
        uint256[] calldata amounts
    ) external;

    // -- two step transition mod
    function startRunnerTransition(address newRunner) external;
    function acceptRunnerTransition() external;
}
