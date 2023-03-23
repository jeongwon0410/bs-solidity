// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {

    uint[] a;

    function push(uint _a) public{
        a.push(_a);
    }

    function pop() public {
        a.pop();
    }

    function getLen() public view returns(uint){
        return a.length;
    }

    function getNum(uint _n) public view returns(uint){
        return a[_n-1];
    }

    function delete2(uint _n) public{
        // delete a[_n-1]

        for(uint i=_n;i<a.length;i++){
            a[i-1]=a[i];
        }

        a.pop();
    }


}