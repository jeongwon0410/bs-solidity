pragma solidity 0.8.0;

contract AA{
//상태변수 a가 있습니다. 함수 A와 B는 각각 a가 5이상이어야 실행됩니다.
//함수 A와 B를 구현하세요. 각각 _a, _b를 input 값으로 받습니다. 
//각각 _a 그리고 _b를 return 값으로 받습니다.

    uint a;

    modifier biggerthanFive(){
        require(a>5);
        _;
    }

    function A(uint _a) public view biggerthanFive returns(uint){
        
        return _a;
    }

    function B(uint _b) public view  returns(uint){
        return _b;
    }


}

contract BB {
    uint a;

    modifier aplus{
        a++;
        _;
    }

    function A(uint _a) public aplus returns(uint){
        
        return _a;
    }

    function B(uint _b) public view  returns(uint){
        return _b;
    }


    function getA() public view returns(uint){
        return a;
    }


}


contract CC {
    uint a;

    modifier acheck(uint _a){
        require(_a >= 5);
        _;
    }

    modifier acheck2(uint _d, uint _e){
        require(_d > 5 && _e > 5);
        _;
    }

    function A(uint _a) public acheck(_a) returns(uint){
        
        return _a;
    }

    function B(uint _b) public view  returns(uint){
        return _b;
    }

    function A2(uint _a, uint _b) public view acheck2(_a,_b) returns(uint,uint){
        return (_a,_b);
    }


    function getA() public view returns(uint){
        return a;
    }


}

contract DD {
    uint a;

    modifier aplus{
       
        a++;
        _;
       
    }

    function A(uint _a) public aplus returns(uint){
        return a+_a;
    }

    function B(uint _b) public view returns(uint){
        return a+_b;
    }

    function getA() public view returns(uint){
        return a;
    }
}

contract EE{
    modifier aplus {
        a++;
        _;
    }

    modifier biggerthanFive {
        require(a>5);
        _;
    }

    uint a=5;

    function A(uint _a) public aplus biggerthanFive returns(uint){
        return _a;
    }

    function B(uint _a) public biggerthanFive aplus returns(uint){
        return _a;

    }

    function getA() public view returns(uint){
        return a;
    }
}


contract FF{

    modifier biggerthanFive(uint a) {
        require(a>5);
        _;
    }


    function A(uint _a) public biggerthanFive(_a) returns(uint){
        return _a;
    }

    function B(uint _a) public biggerthanFive(_a*3) returns(uint){
        return _a;

    }

}


contract AA1{
    uint public a =3;
    modifier Acase {
        a++;
        _;
        a--;
    }

    modifier biggerthanFive {
        require(a>3);
        _;
        
    }

    function A() public Acase returns(uint){
        return a;
    }

    function B() public biggerthanFive returns(uint){
        return a;

    }

    function C() public Acase biggerthanFive returns(uint){ //Acse a++실행 biggerthanfive 실행 Acase a--실행
        return a;
    } 

    function D() public biggerthanFive Acase returns(uint){
        return a;
    }
        
}

contract AA2{
    uint public a = 3;
    modifier Acase1 {
        a++;
        _; //해당 함수 실행 
        a--;
    }

    modifier Acase2 {
        a++;
        _;//해당 함수 실행
        _;//해당 함수 실행
        a--;
    }

    function A1() public Acase1 returns(uint){
        a=a+1;
        return a;
    }

    function A2() public Acase2 returns(uint){
        a=a+1;
        return a;
    }
}

contract AA3{
    modifier biggerthanFive(uint _a){
        if(_a > 10){
            revert("Too big : 10!!");
        } else{
            _;
        }
    }


    function A(uint _a) public biggerthanFive(_a) view returns(uint){
        return _a;
    }
}