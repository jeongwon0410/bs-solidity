// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract AAA {

    struct student {
        string name;
        uint number;
        uint birth;
        uint score;
        string credit;
    }

    mapping(address => student) Students;

    address ownerAddress;
    function setOwner() public {
        ownerAddress = msg.sender;
    }

    function addStudent(string memory _name, uint _number, uint _birth, uint _score) public {
        string memory _credit = scoreBoard(_score);
        Students[msg.sender] = student(_name,_number,_birth,_score,_credit);
    }

    function deleteStudent(address _a) public {
        require(ownerAddress == msg.sender);
        delete Students[_a];
    }

    function getStudent(address _a) public view returns(string memory, uint, uint,uint,string memory ){
        uint birth = Students[_a].birth;
        string memory name = Students[_a].name;
        uint score = Students[_a].score;
        uint number = Students[_a].number;
        string memory credit = Students[_a].credit;
        return (name,birth,score,number,credit);
    }

    function scoreBoard(uint _score) public view returns(string memory){
        if(_score >= 90){
            return 'A';
        }else if(_score >= 80 && _score < 90){
            return 'B';
        }else if(_score >= 70 && _score < 80){
            return 'C';
        }else if(_score >= 60 && _score < 70){
            return 'D';
        }else{
            return 'F';
        }
    }

    function applicationClasses() public view returns(string memory){
        require(keccak256(bytes(Students[msg.sender].credit)) == keccak256(bytes("B")) || keccak256(bytes(Students[msg.sender].credit)) == keccak256(bytes("A")));
        return "application";
    }

}