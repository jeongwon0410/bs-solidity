// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {

    struct student {
        string name;
        uint number;
        uint score;
    }
    student[] Students;
    address owner;
    constructor(){
        owner = msg.sender;
    }

    function addStudent(string memory _name, uint _score) public{
        require(msg.sender == owner);
        Students.push(student(_name,Students.length+1,_score));
    }

    function transferStudent(string memory _name) public {
        require(msg.sender == owner);
        uint n = getName(_name);
        for(uint i = n;i<Students.length-1;i++){
            Students[i] = Students[i+1];
            Students[i].number = n;
                
        }

        Students.pop();
    }

    
    function getName(string memory _name) public view returns(uint){
        for(uint i = 0;i<Students.length;i++){
            if( keccak256(bytes(Students[i].name)) == keccak256(bytes(_name))){
                return i;
            }
                
        }
    }

    function getSumScore() public view returns(uint){
        uint scoreSum = 0;
        for(uint i=0;i<Students.length;i++){
            scoreSum = scoreSum+Students[i].score;
        }

        return scoreSum;

    }




}