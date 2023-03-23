// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import './a.sol';
import "hardhat/console.sol";
contract AA {
    A public a = new A("C",10);

    function get() public returns(string memory, uint){
        a.getNN();
    }
    
}


contract AB {
    A public a;

    uint public b_number;

    function setA( string memory b,uint _a) public {
        a = new A(b,_a);
    }


    function setA2(address _a) public returns(uint,string memory){
        a = A(_a);
        console.log(address(a));
        return a.getNN();
    }


    // function show() public view returns(address){
    //     return (address(a));
    // }


}