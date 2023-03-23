// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract AAA {
    address owner;
    constructor(){
        owner = msg.sender;
    }
    uint a;
    function setA(uint _a) public {
        require(owner == msg.sender);
        a = _a;
    }   
    function getA() public view returns(uint){
        return a;  
    }

}


contract A {
    uint a;
    uint b;


    constructor(uint _a, uint _b){
        a = _a;
        b = _b;
    }

    function getAB() public view returns(uint, uint){
        return (a,b);
    }

    function setAB(uint _a, uint _b) public {
        a = _a;
        b = _b;
    }


}

contract B {
    A c;

    constructor(address _a){
        c = A(_a);
    }
    

    function get() public view returns(uint, uint){
        return c.getAB();
    }
}


contract C {
    struct D{
        uint a;
        string b;
    }
    D e;

    function setD() public {
        e.a =1;
        e.b = "a";
    }

    function getD() public view returns(uint, string memory){
        return (e.a,e.b);
    }

}


