//SPDX-License-Identifier: MIX
pragma solidity ^0.8.20;

interface IMultiSignature {
    /**
     * @dev 
     * @param msgHash dev hash of the message  
     * @param lastIndex     last index of the signature array
     */
    function getValidSignature(
        bytes32 msgHash,
        uint256 lastIndex
    ) external view returns (uint256);
}

contract multiSignatureClient {
    uint256 private constant multiSignaturePosition = uint256(keccak256("multiSignature")));
    uint256 private constant defaultIndex = 0;

    /**
     * @dev 
     * @param multiSignature address of the multiSignature contract
     */
    constructor(address multiSignature) public {
        require(multiSignature != address(0), "multiSignature address cannot be zero");
        saveValue(multiSignaturePosition, uint256(multiSignature));
    }

    /**
     * @dev 
     * @param position 
     * @param value 
     */
    function saveValue(uint256 position, uint256 value) internal {
        assembly {
            sstore(position, value)
        }
    }
}


