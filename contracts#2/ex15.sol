pragma solidity 0.8.12;

contract Visibility {
    uint a;

    function privateF2() private returns(address){
        // a=a+10;//address(this)가 실행
        // return a;
        return msg.sender;
    }

    function testPrivate() public returns(address){
        return msg.sender;
        // return privateF2();//지갑이 실행
    }

    function getA() public view returns(uint){
        return a;
    }

}

contract Child2{
    Visibility vs = new Visibility();

    function testGetA() public view returns(uint){
        return vs.getA();
    }

    function getAddress() public view returns(address){
        return address(vs);
    }
}

contract Child3{
    Visibility vs;

    constructor(address A){
        vs = Visibility(A);
    }


    function testGetA() public view returns(uint){
        return vs.getA();
    }

    function getAddress() public view returns(address){
        return address(vs);
    }
}

