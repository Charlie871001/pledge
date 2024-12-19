// SPDX-Lincense-Identifier: MIT

pragma solidity ^0.8.0;

interface IDebtToken {
    /**
     * @dev Returns the amount of tokens owned by `account`.
     * @param account The address of the account
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Returns the amount of tokens in existence of the account
     * @param account The address of the account
     */
    function totalSupply(address account) external view returns (uint256);

    /**
     * @dev  Minting tokens for specific account
     * @param account The address of the account
     * @param amount   TThe amount of tokens to mint
     */
    function mint(address account, uint256 amount) external;

    /**
     * @dev Burning tokens for specific account
     * @param account The address of the account
     * @param amount The amount of tokens to burn
     */
    function burn(address account, uint256 amount) external;
}