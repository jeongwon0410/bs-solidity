
// SPDX-License-Identifier: GPL-3.0
// 20220923
pragma solidity 0.8.0;

contract A{
    uint[] a; //상태변수가 변하므로 가스비 많이 들어 view를 사용할 수 없음 
    function forloop() public{
        uint i;
        for(i =0;i<11;i++){
            a.push(i);
        }
    }

    function getNumber(uint _n) public view returns(uint){
        return a[_n-1];
    }

    function score(uint n) public view returns(uint){
        if(n>=90){
            return 1;
        }else if(n>=80){
            return 2;
        }else{
            return 3;
        }

    }

}