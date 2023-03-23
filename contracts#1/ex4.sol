// SPDX-License-Identifier: GPL-3.0
// 20220928
pragma solidity 0.8.0;

contract EEE {
    address payable owner;

    function setOwner() public {
        owner = payable(msg.sender);
    }

    function send() public payable {
        owner.transfer(msg.value);
    }

    function send2() public payable {
        payable(msg.sender).transfer(msg.value);
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function myBalance() public view returns(uint) {
        return address(msg.sender).balance;
    }
}