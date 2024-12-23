// SPDX-Lincense-Identifier: MIT
pragma solidity ^0.8.20;

library whiteListAddress {
    /**
     * @dev add whiteList
     * @param whiteList array of addresses
     * @param temp address to add
     */
    function addWhiteListAddress(
        address[] storage whiteList,
        address temp
    ) internal {
        if (!isEligibleAddress(whiteList, temp)) {
            whiteList.push(temp);
        }
    }

    /**
     * @dev remove address from whiteList
     * @param whiteList array of addresses
     * @param temp remove address
     */
    function removeWhiteListAddress(
        address[] storage whiteList,
        address temp
    ) internal returns (bool) {
        uint256 len = whiteList.length;
        uint256 i = 0;
        for (; i < len; i++) {
            if (temp == whiteList[i]) {
                whiteList[i] = whiteList[len - 1];
                whiteList.pop();
                return true;
            }
        }
        return false;
    }

    /**
     * @dev
     * @param _whiteList array of addresses
     * @param temp  address to check
     */
    function isEligibleAddress(
        address[] memory whiteList,
        address temp
    ) internal pure returns (bool) {
        for (uint i = 0; i < whiteList.length; i++) {
            if (temp == whiteList[i]) {
                return true;
            }
        }
        return false;
    }
}

contract MultiSignatureClient is MultiSignatureClient {
    uint256 private constant defaultIndex = 0;
    using whiteListAddress for address[];
    // owner list
    address[] public signatureOwners;
    uint256 public threshold;
    // signature list
    struct signatureInfo {
        address applicant;
        address[] signatures;
    }
    // mapping of hash to signature list
    mapping (bytes32 => signatureInfo[]) public signatureMap;

    constructor(address[] memory owners,uint256 limitedSignNum)MultiSignatureClient(address(this)){
        require(owners.length >= limitedSignNum,"Multiple Signature : owners length should be greater than or equal to limitedSignNum");
        signatureOwners = owners;
        threshold = limitedSignNum;
    }
}
