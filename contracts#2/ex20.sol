// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract A {

    function five(uint a) public pure returns(bool){
        uint b = a%10;
        if(b%5==0){
            return true;
        }else {
            return false;
        }
    }


    function nine(uint a) public pure returns(bool){
        uint b;
        while(a/10 !=0 || a%10 !=0){
            b+= a%10;
            a = a/10;
        }

        if(b%9==0){
            return true;
        }else{
            return false;
        }
    }

    function eleven(int a) public pure returns(bool){
        int b;
        uint index =1;

        while(a/10 !=0 || a%10 !=0){
            b += a%10*(-1)**(index+1);
            a = a/10;
            index++;
        }

        if(b%11==0){
            return true;
        }else{
            return false;
        }
    }


    function convert() public {
        uint i =15;
        bytes memory a  = abi.encodePacked(i);
    }


    

}


contract BYTESUINT {
    function bytesToUint(bytes memory b) public pure returns (uint256){
        uint256 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint(uint8(b[i]))*(2**(8*(b.length-(i+1))));
        }
        return number;
    }

    function uintToBytes(uint a) public pure returns(bytes memory) {
        return abi.encodePacked(a);
    }
}