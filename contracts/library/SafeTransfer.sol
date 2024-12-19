// SPDX-Lincense-Identifier: MIT

pragma solidity 0.8.20;

contract SafeTransfer {
    using SafeERC20 for IERC20;
    event Redeem(
        address indexed recieptor,
        address indexed token,
        uint256 amount
    );

    /**
     * @notice  transfers money to the pool
     * @dev function to transfer
     * @param token of address
     * @param amount of amount
     * @return return amount
     */
    function getPayableAmount(
        address token,
        uint256 amount
    ) internal returns (uint256) {
        token == address(0)
            ? amount = msg.value;
            : IERC20(token).safeTransferFrom(msg.sender, address(this), amount);

        return amount;
    }

    /**
     * @dev An auxiliary foundation which transter amount stake coins to recieptor.
     * @param recieptor account.
     * @param token address
     * @param amount redeem amount.
     */
    function redeem(
        address token,
        address payable recieptor,
        uint256 amount
    ) internal {
        if (amount > 0) {
            token == address(0)
                ? recieptor.transfer(amount)
                : IERC20(token).safeTransfer(recieptor, amount);
            emit Redeem(recieptor, token, amount);
        }
   }
}
