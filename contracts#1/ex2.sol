// SPDX-License-Identifier: GPL-3.0
// 20220927
pragma solidity 0.8.0;

contract AAA {
    mapping(address => uint) balance;

    function setBalance() public payable {
        balance[msg.sender] = msg.sender.balance;
    }

    function getBalance() public view returns(uint) {
        return balance[msg.sender];
    }

    function deleteBalance() public {
        delete balance[msg.sender];
    }
}