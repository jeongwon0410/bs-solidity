// SPDX-License-Identifier: GPL-3.0
// 20220927
pragma solidity 0.8.0;

contract AAA {
    address ownerAddress;
    function setOwner() public {
        ownerAddress = msg.sender;
    }

    function getOwner() public view returns(address){
        return ownerAddress;
    }

    function onlyOwner() public view returns(uint){
        require(ownerAddress == msg.sender);
        return 1;
    }

    function ex(uint _n) public view returns(uint){
        require(_n>=10);
        return _n*2;
    }



}