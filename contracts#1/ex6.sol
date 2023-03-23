contract A {
    
    
    address teacher;
    constructor(){
        teacher = msg.sender;
    }


    struct student {
        string name;
        uint number;
        uint birthday;
        uint score;
        string credit;
    }

    mapping(address => student) list;

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

    function setStudent(string memory _name, uint _number, uint _birthday, uint _score) public {
        string memory _credit;
        _credit = creditSet(_score);
        list[msg.sender] = student(_name, _number, _birthday, _score, _credit);
    }

    function getStudent(address _a) public view returns(string memory, uint, uint, uint, string memory) {
        require(getValue() != 0);
        return (list[_a].name, list[_a].number, list[_a].birthday, list[_a].score, list[_a].credit);
    }

    function deleteStudent(address _a) public {
        require(msg.sender == teacher);
        delete list[_a];
    }

    // address teacher;

    // function setTeacher() public {
    //     teacher = msg.sender;
    // }

    address[] extra;

    function extraCur() public {
        require(keccak256(bytes(list[msg.sender].credit)) == keccak256("A") || keccak256(bytes(list[msg.sender].credit)) == keccak256("B"));
        extra.push(msg.sender);
    }

    function getLength() public view returns(uint) {
        return extra.length;
    }

    function getValue() public view returns(uint) {
        return list[msg.sender].number * list[msg.sender].birthday * list[msg.sender].score;
    }
}