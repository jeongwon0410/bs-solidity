pragma solidity 0.8.0;

contract pureView{
    uint a;
    // view 밖에서 값을 읽음
    // pure 밖에서 값을 못 읽음
    //안됨
    // function setA() public pure returns(uint){
    //     a = 10;
    //     return a; 
    // }

    function setA() public returns(uint){
        a = 10;
        return a;
    }

    function setB() public view returns(uint){
        uint b = a+10;
        return b;
    }

    function setB2(uint b) public view returns(uint){
        b = a+b;
        return b;
    }

    function setC(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    function setC2(uint a, uint b) public view returns(uint){
        return a+b;
    }
}