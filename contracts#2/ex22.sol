// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract A {
    string name;
    uint num;
    constructor(string memory _name,uint _num){
        name = _name;
        num = _num;
    }

    function getNN() public view returns(uint, string memory){
        return(num,name);
    }


}


contract B is A("A",10){
    uint b_number;

    function setB(uint _b) public returns(uint){
        b_number = _b;
        return b_number;
    }
}