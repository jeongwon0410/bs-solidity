pragma solidity 0.8.0;

contract A {

    struct student{
        uint num;
        string name;
        uint score;
    }

    // mapping(address => student) students;
    student[] studentList;
    function setStudent(string memory _name, uint _score) public {
        studentList.push(student(studentList.length+1, _name, _score));
         
    }

    function getStudent(uint _num) public view returns( string memory, uint){
        return (studentList[_num-1].name, studentList[_num-1].score);
    }

    function getAllStudent() public view returns(student[] memory){
        return studentList;
    }

    function getLowScoreStudent() public view returns( string memory, uint){
        uint low_score = 100;
        uint s;
        for(uint i =0;i<studentList.length;i++){
            if(low_score > studentList[i].score){
                low_score = studentList[i].score;
                s = i;
            }
        }
        return (studentList[s].name, studentList[s].score);
    }

    function getScoreBoard() public view returns(uint, uint){
        uint sum;
        uint avg;
        for(uint i=0;i<studentList.length;i++){
            sum+=studentList[i].score;
        }
        avg = sum/studentList.length;

        return (sum,avg);
    }





}