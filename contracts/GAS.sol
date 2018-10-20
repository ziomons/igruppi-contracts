pragma solidity ^0.4.24;

import "./UserManager.sol";
import "./SafeMath.sol";


contract GAS is UserManager {
    using SafeMath for uint;

    constructor(string _ownerMetadata) {
        addUser(msg.sender, _ownerMetadata);
    }

    function()
        public
        payable
        onlyUser
    {
        userMapping[msg.sender].userBalance.add(msg.value);
    }

    function withdraw()
        public
        onlyOwner
    {
        msg.sender.transfer(this.balance);
    }

    function currentBalance()
        public
        constant
        returns(uint)
    {
        return this.balance;
    }
}
