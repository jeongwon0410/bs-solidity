pragma solidity 0.8.0;

contract A {

    uint a;
    uint b;

    function setAB(uint _a, uint _b) public {
        (a, b) = (_a, _b);
    }

    function setAB2(uint _a, uint _b) public {
        a = _a;
        b = _b;
    }

    function getAB() public view returns(uint, uint) {
        return (a,b);
    }

    

}