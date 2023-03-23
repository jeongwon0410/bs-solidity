// SPDX-License-Identifier: GPL-3.0
// 20220926
pragma solidity 0.8.0;

/*
이 코드에는solidity 내 함수의 visibility에 대한 내용이 들어있음.
visibility란 접근 가능 범위를 의미함.
종류에는 private, public, internal, external이 있음.
*/

contract Visibility {
    //우리는 외부라서 private을 조작할 수 없음
    function privateF() private pure returns (string memory) {
        return "private";
    }
    //private을 접근하기 위해 함수를 사용하여 public으로 접근
    function testPrivate() public pure returns (string memory) {
        return privateF();
    }
    
    //우리는 외부라서 internal 조작할 수 없음
    function internalF() internal pure returns (string memory) {
        return "internal";
    }
    //internal 접근하기 위해 함수를 사용하여 public으로 접근
    function testInternal() public pure virtual returns (string memory) {
        return internalF();
    }

    function publicF() public pure returns (string memory) {
        return "public";
    }
//외부에서만 접근
    function externalF() external pure returns (string memory) {
        return "external";
    }
}

//상속 받은 함수는 internal함수를 조작할 수 있다. private는 조작할 수 없다
contract Child is Visibility {
    function testInternal2() public pure returns(string memory) {
        return internalF();
    }

    function testPublic() public pure returns(string memory) {
        return publicF();
    }
}