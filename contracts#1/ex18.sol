

// SPDX-License-Identifier: GPL-3.0
// 20220923
pragma solidity 0.8.0;

contract A{
    uint a;
    uint[] array;
    string[] sarray;

    function pushNumber(uint a) public {
        array.push(a);
    
    }

    function pushString(string memory s) public {
        sarray.push(s);
    }

    function popNumber() public {
        array.pop();
    }
    

    function getNumber(uint _n) public view returns(uint){
        return array[_n-1];
    }

    function getArrayLength() public view returns(uint) {
        return array.length; // 배열명.length
    }

    function getLastNumber() public view returns(uint){
        return array[array.length-1];
    }

    function getLastNumber2() public view returns(uint){
        return getNumber(getArrayLength());
    }

    function getName(uint _a) public view returns(string memory){
        return sarray[_a-1];
    }


}