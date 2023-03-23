// SPDX-License-Identifier: GPL-3.0
// 20221117
pragma solidity 0.8.0;

/*
A - Alice, 1, 1990, 95
B - Bob, 2, 1995, 85
C - Charlie, 3, 1997, 75
D- Dickson, 4, 1999, 65
E - Eric, 5, 2002, 55
*/

/*
1번 지갑은 선생님입니다. 2,3,4,5,6,7,8,9,10번은 학생입니다.
이름, 번호, 생일, 점수 그리고 학점을 포함한 학생이라는 구조체를 생성하고 학생을 추가하고 삭제하고 조회하는 기능을 추가하세요.
학점은 90점 이상이면 A, 90점 미만 80점 이상이면 B, 80점 미만 70점 이상이면 C, 70점 미만 60점 이상이면 D 그 이외는 F 입니다.
학생 추가 기능 - 이 기능은 누구나 사용할 수 있습니다만 = 보통 학생들이 직접 사용할 예정입니다. 학생들이 본인의 정보를 추가할 때 자신의 지갑주소와 mapping이 될 수 있게 해주세요. (값은 임의대로 넣으세요)
학생 삭제 기능 - 이 기능은 특정 주소의 지갑소유자(선생님)만이 실행할 수 있습니다. 삭제할 때는 학생의 지갑주소를 기반으로 삭제합니다.
학생 조회 기능 - 이 기능은 누구나 사용할 수 있습니다. 조회할 때는 학생의 지갑 주소를 기반으로 조회합니다. 조회는 이름, 번호, 생일, 점수 그리고 학점을 모두 조회할 수 있어야 합니다.
심화반 신청 - 학생들이 사용하는 기능입니다. 학점이 B 이상인 학생들만 수강할 수 있는 반입니다.
선생님 신청 - 지갑의 주소가 선생임을 증명할 수 있게 선생님 신청을 할 수 있는 기능을 만들어주세요.
*/

contract A {
    struct student {
        string name;
        uint number;
        uint birthday;
        uint score;
        string credit;
    }

    MoE public moe;
    // address minister;
    mapping(address => student) public list;
    address[] public students;

    address teacher;
    uint[]  public index;
    uint public second;

    constructor(address _addr) {
        teacher = msg.sender;
        moe= MoE(_addr);
    }


    function scoreReport() public {
        // minister
        
        moe.reportScore();
    }

    function schoolRegister() public {
        moe.registerSchool();
    }


    function creditSet(uint a) public returns(string memory) {
        if(a>=90) {
            return "A";
        } else if(a>=80) {
            return "B";
        } else if(a>=70) {
            return "C";
        } else if(a>=60) {
            return "D";
        } else {
            return "F";
        }
    }

    function setStudent(string memory _name, uint _birthday, uint _score) public {
        // require(msg.sender == teacher);
        string memory _credit;
        _credit = creditSet(_score);
        students.push(msg.sender);
        list[msg.sender] = student(_name, students.length, _birthday, _score, _credit);
    }

	function getStudent(address _a) public view returns(string memory, uint, uint, uint, string memory) {
        require(getValue()!=0);
        return (list[_a].name, list[_a].number, list[_a].birthday, list[_a].score, list[_a].credit);
    }

    // function getAllStudent() public view returns(student memory){
    //     for(uint i =0;i<students.length;i++){
    //         list[students[i]]
    //     }
    // }



    function getValue() public view returns(uint) {
        return list[msg.sender].number * list[msg.sender].birthday * list[msg.sender].score;
    }

    function deleteStudent(address _a) public {
        require(msg.sender == teacher);
        uint start = list[_a].number;
        for(uint i =start+1;i<students.length;i++){
            list[students[i]].number = i-1;
            students[i] = students[i+1];
        }
        students.pop();
        delete list[_a];

        getTotalscore();

    }

    address[] extra;

    function extraCur() public {
        require(keccak256(bytes(list[msg.sender].credit)) == keccak256("A") || keccak256(bytes(list[msg.sender].credit)) == keccak256("B"));
        extra.push(msg.sender);
    }

    function getLength() public view returns(uint) {
        return extra.length;
    }


    function getTotalscore() public view returns(uint) {
        uint sum;
        
        for(uint i=0; i<students.length; i++) {
            sum += list[students[i]].score;
        }

        return sum;
    }

    function getAvg() public view returns(uint){
        uint total = getTotalscore();
        uint avg = total/students.length;
        return avg;

    }
    function getLowestScoreStudent() public view returns(uint){
        student memory result=list[students[0]];
        for(uint i=1;i<students.length;i++){
            if(list[students[i]].score<result.score){
                result=list[students[i]];
            }
        }

        return result.number;
    }



}

contract MoE {
    A public sc;
    struct School {
        address addr;
        string rank;
        uint average;
        uint extra_num;
    }

    // sc.list() student;

    // mapping(address => sc.student) list;

  

    mapping(address=>School) schools;


    function schoolRank(uint avg)public view returns(string memory){
        // uint avg = aa.getAvg();
        string memory credit;
        if(avg>=90) {
            credit = "A";
        } else if(avg>=80) {
            credit = "B";
        } else if(avg>=70) {
            credit = "C";
        } else if(avg>=60) {
            credit = "D";
        } else {
            credit = "F";
        }

        return credit;

    }

    function getSchool(address _a) public view returns(School memory){
        return schools[_a];

    }

    function registerSchool() public {
        sc = A(msg.sender);
        schools[msg.sender] = School(msg.sender,schoolRank(getAverage()),getAverage(),sc.getLength());
    }

    function reportScore() public {//학교의 contract  주소
        schools[msg.sender] = School(msg.sender, "", 0,0);
        // schools[msg.sender].average = 100;

    }

    function getAverage() public returns(uint){
        // sc = A();
        uint score = sc.getTotalscore();
        uint avg = sc.getAvg();
        // uint[] memory a = sc.index();
        // uint a = sc.second();
        return avg;
        // student = sc.list;
    }

}

