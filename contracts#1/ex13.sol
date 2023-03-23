// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {
    struct lecturer {
        string l_name;
        string[] lectures;
        uint lecture_num;
    }
    // address[] teacher_list;
    mapping(address => lecturer) lecturers;

    struct student {
        uint number;
        string s_name;
        uint class_num;
    }

    mapping(address => student) students;

    mapping(string => address[]) class;

    function hash(string memory _a) public view returns(bytes32) {
        return keccak256(bytes(_a));
    }

    // 선생등록
    function setTeacher(string memory _name) public {
        lecturers[msg.sender].l_name = _name;
    }

    // 선생 정보 불러오기
    function getTeacher(address _a) public view returns(string memory, uint) {
        return (lecturers[_a].l_name, lecturers[_a].lecture_num);
    }

    // 학생등록
    function setStudent(uint _a, string memory _b) public {
        students[msg.sender].number = _a;
        students[msg.sender].s_name = _b;
    }

    //학생 정보 불러오기
    function getStudent(address _a) public view returns(uint, string memory, uint) {
        return (students[_a].number, students[_a].s_name, students[_a].class_num);
    }

    // 수업등록, 강의자
    function makeClass(string memory _c_name) public {
        // 선생만 가능, 선생인지 확인
        require(keccak256(bytes(lecturers[msg.sender].l_name)) != 0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470);
        //class[_c_name].push();
        class[_c_name]; // 수업 등록
        lecturers[msg.sender].lectures.push(_c_name); // 내 수업 목록 수업 추가
        lecturers[msg.sender].lecture_num++; // 내 수업 개수 추가
    }

    function enrollClass(string memory _c_name) public {
        require(class[_c_name].length < 4);
        require(students[msg.sender].class_num < 2);
        // 수업에 학생 추가
        class[_c_name].push(msg.sender);
        students[msg.sender].class_num++;
    }
}

contract B{

    mapping(string => address[]) class;
    function makeClass(string memory _c_name) public {
        class[_c_name];
    }


    function getClass(string memory _c_name) public view returns(address){
        // return msg.sender;
        return class[_c_name][0];
    }

    function getLen(string memory _c_name) public view returns(uint){
        return class[_c_name].length;
    }

    function makeClass2(string memory _c_name) public {
        class[_c_name].push();
    }

    function makeClass3(string memory _c_name) public {
        class[_c_name].push(msg.sender);
        class[_c_name].pop();
    }
}