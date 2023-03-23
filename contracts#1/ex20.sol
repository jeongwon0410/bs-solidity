
// SPDX-License-Identifier: GPL-3.0
// 20220923
pragma solidity 0.8.0;

contract C{

    address b;

    function getAddress() public view returns(address){
        return address(this);

    }
    function myAddress() public view returns(address){
        return address(msg.sender);
    }

    function myAddress1() public view returns(address){
        return msg.sender;
    }

    function myBalance() public view returns(uint){
        return address(msg.sender).balance;
    }


// payable함수는 함수 중 유일하게 코인을 전송할 수 있는 함수
    function send() public payable returns(uint){
        uint a = msg.value;  // msg.value는 결국 해당 컨트랙트로 전송됨
        return a;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }



}
