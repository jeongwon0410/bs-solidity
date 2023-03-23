pragma solidity 0.8.0;

contract A {
    uint[] a;

    function push(uint _a) public {
        a.push(_a);
    }

    function pop() public{
        a.pop();
    }

    function get(uint _n) public view returns(uint){
        return a[_n-1];
    }

    function getLen() public view returns(uint){
        return a.length;
    }

    function getArr() public view returns(uint[] memory){
        return a;
    }



}