// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {
    string name;
    uint age;

    address owner;
    constructor(string memory _name, uint _age){
        name = _name;
        age = _age;
        owner= msg.sender;
    }


    function get() public view returns(string memory, uint){
        return(name, age);
    }

    function set(string memory _name, uint _age) private { 
        // require(msg.sender == owner);
        name = _name;
        age = _age;
    }

    
    function set2(string memory _name, uint _age) public returns(address){ 
        return msg.sender;
        require(msg.sender == owner);
        set(_name,_age);
    }

//외부 접근
    function testExternal() external returns(string memory){
        return "A";
    }

}

contract B{
    A  cont_a;

    constructor(address _A){
        cont_a = A(_A);
    }

    function setAB(string memory _name, uint _age) public returns(address) {
        cont_a.set2(_name,_age);

        return cont_a.set2(_name, _age); // 결과값 반환 set2 address contract B의 주소
    }

    function testExternal2() public{
        cont_a.testExternal();
    }

}


contract C {
    bytes32 pw = 0x3ac225168df54212a25c1c01fd35bebfea408fdac2e31ddd6f80a4bbf9a5f1cb;
    uint a ;
    
    function getHash(string memory _a) public returns(bytes32){
        return keccak256(bytes(_a));
        
    }

    function setNumber(string memory _pw, uint _a) public returns(uint){
        bytes32 password = getHash(_pw);
        require(password == pw);

        a = _a;
        return a;
    }

}