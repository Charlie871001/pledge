//SPDX-Lincense-Identifier:MIT

pragma solidity 0.8.20;

interface ERC20Interface{
    /**
     * @dev Returns the amount of tokens owned by `user`
     * @param user address
     */
    function balanceOf(address user) external view returns(uint256);
}