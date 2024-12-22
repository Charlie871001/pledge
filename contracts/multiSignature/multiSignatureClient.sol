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
    uint256 private constant multiSignaturePosition = uint256(keccak256("org.multiSignature.storge"));
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
     */
    function getMultiSignatureAddress() public view returns(address){
        return address(getValue(multiSignaturePosition));
    }

    modifier validCall {
        checkMultiSignature();
        _;
    }

    /**
     * @dev check if the transaction is approved by the multiSignature contract
     */
    function checkMultiSignature() internal {
        address multiSignature = getMultiSignatureAddress();
        bytes32 msgHash = keccak256(abi.encodePacked(msg.sender, address(this)));
        uint256 newIndex = IMultiSignature(multiSignature).getValidSignature(msgHash, defaultIndex);
        require(newIndex > defaultIndex, "multiSignatureClient: This tx is not approved");
    }

    /**
     * @dev get value from storage
     * @param position 
     */
    function getValue(uint256 position) internal view returns(uint256 value){
        assembly {
            value := sload(position)
        }
    }

    /**
     * @dev save value to storage
     * @param position 
     * @param value 
     */
    function saveValue(uint256 position, uint256 value) internal {
        assembly {
            sstore(position, value)
        }
    }
}


