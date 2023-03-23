// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/token/ERC20/ERC20.sol';

contract AToken is ERC20("A_simple","AS") {
    constructor(uint totalSupply){
        _mint(msg.sender,totalSupply);
    }

    

    receive() external payable{}
}