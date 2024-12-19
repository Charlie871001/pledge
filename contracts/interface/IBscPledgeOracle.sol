// SPDX-Lincense-Identifier:MIT

pragma solidity 0.8.20;

interface IBscPledgeOracle{
    /**
     * @notice retrieves price of an asset
     * @dev function to get price for an asset
     * @param asset 
     * @return uinte256 mantissa of asset price (scaled by 1e8) or zero if unset or contract paused
     */
    function getPrice(address asset) external view returns(uint256);
    /**
     * @dev function to get price of underlying asset
     * @param cToken 
     */
    function getUnderlyingPrice(address cToken) external view returns(uint256);

    function getprices(address[] calldata assets) external view returns(uint256[] memory);
}