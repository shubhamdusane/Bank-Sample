// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract Bank {
    mapping (address=>uint) balance;

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }


    function wit(uint amt) public {
        require(amt <= balance[msg.sender]);
        balance[msg.sender] -= amt;
        payable(msg.sender).transfer(amt);
    }

    function dep() public payable {
        balance[msg.sender] += msg.value;
    }
}