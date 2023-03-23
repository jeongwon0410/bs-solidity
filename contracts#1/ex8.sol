// SPDX-License-Identifier: GPL-3.0
// 20221118

// B와 C 배포시 비교
// B - 특정 주소 참조
// C - 새롭게 배포

pragma solidity 0.8.0;

contract A {
    uint public a;
    uint public b;

    constructor(uint _a, uint _b) {
        a = _a;
        b = _b;
    }

    function getAB() public view returns(uint, uint) {
        return (a,b);
    }

    function setAB(uint _a, uint _b) public {
        a = _a;
        b = _b;
    }

    
}

contract B {
    A c; //contract A형 변수 c
    constructor(address _A) {
        c = A(_A); // 
    }

    function get() public view returns(uint, uint) {
        return c.getAB();
    }
}

contract C {
    A c = new A(3,5);

    function getAB2() public view returns(uint, uint) {
        return c.getAB();
    }

    function setAB2() public {
        c.setAB(2,4);
    }
}

contract D {
    A c;
    constructor(uint _a, uint _b) {
        c = new A(_a, _b);
    }

    function getAB3() public view returns(uint, uint) {
        return c.getAB();
    }
}

contract E {
    A c;
    constructor(address _A){
        c = A(_A);
    }
    function getA() public view returns(uint){
        return c.a();
    }

    function setA(uint _a) public {
        c.a() = _a;
    }
}