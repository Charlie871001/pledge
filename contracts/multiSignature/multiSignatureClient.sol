//SPDX-License-Identifier: MIX
pragma solidity ^0.8.20;

interface IMultiSignature {
    function getValidatorCount(
        bytes32 msgHash,
        uint256 lastIndex
    ) external view returns (uint256);
}


