
// SPDX-License-Identifier: GPL-3.0
// 20220923
pragma solidity 0.8.0;

contract B{

    struct student {
        string name;
        uint birth;
        uint number;

    }

    student[] Students;

    function pushStudents(string memory _name, uint _birth, uint _number) public {
        Students.push(student(_name,_birth,_number));

    }

    function popStudents(uint _n) public view returns(uint){
        return Students[_n-1].birth;
    }

    function getLen() public view returns(uint){
        return Students.length;
    }

    


    
    


}