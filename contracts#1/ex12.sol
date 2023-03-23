// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {

    struct teacher{
        string name;
        string[] lectures;
        uint lecture_num;
    }

    mapping(address => teacher) Teacher;

    struct student {
        uint num;
        string name;
        uint lecture_num;
    }

    mapping(address => student) Students;

    mapping(string => address[]) Lectures;

    function hash(string memory _a) public view returns(bytes32){
        return keccak256(bytes(_a));
    }

    function addStudent(uint _num, string memory _name) public {
        Students[msg.sender].num = _num;
        Students[msg.sender].name = _name; 
    }

    function getStudent(address _a) public view returns(string memory, uint,uint){
        return(Students[msg.sender].name ,Students[msg.sender].num , Students[msg.sender].lecture_num);
    }

    function addTeacher(string memory _name)  public {
        
        Teacher[msg.sender].name = _name; 
    }

    function getTeacher(address _a) public view returns(string memory, uint){
        return(Teacher[_a].name,Teacher[_a].lecture_num);
    }




    function makeLecture(string memory _lecture) public{


        require(hash(Teacher[msg.sender].name) != hash(""));
        Lectures[_lecture]; // 수강 등록 
        // Lectures[_lecture].push(_a);

        Teacher[msg.sender].lectures.push(_lecture); // 수업 목록 수업 추가
        Teacher[msg.sender].lecture_num++;// 수업 갯수 증가 
        // Teacher[msg.sender].lecture_num = Teacher[msg.sender].lectures.length; 
    }


    function enrollLecture(string memory _lecture) public {
        require(Lectures[_lecture].length < 4);
        require(Students[msg.sender].lecture_num < 2);
        Lectures[_lecture].push(msg.sender);

        Students[msg.sender].lecture_num++;
    }





}