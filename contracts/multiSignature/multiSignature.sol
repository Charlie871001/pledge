// SPDX-Lincense-Identifier: MIT
pragma solidity ^0.8.20;

library whiteListAddress {
    /**
     * @dev add whiteList
     * @param whiteList array of addresses
     * @param temp address to add
     */
    function addWhiteListAddress(address[] storage whiteList,address temp) internal{
        if(!isEligibleAddress(whiteList,temp)){
            whiteList.push(temp);
        }
    }

    /**
     * @dev 
     * @param _whiteList array of addresses
     * @param temp  address to check
     */
    function isEligibleAddress(address[] memory _whiteList,address temp) internal pure returns(bool){
        for(uint i=0;i<_whiteList.length;i++){
            if(temp==_whiteList[i]){
                return true;
            }
        }
        return false;
    }
}