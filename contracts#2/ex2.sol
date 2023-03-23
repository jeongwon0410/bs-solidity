pragma solidity 0.8.0;

contract A {
    struct user{
        uint num;
        string name;
        address addr;
        uint bal;
        uint score;
    }

    mapping(address => user) users;
    address[] roomList;
    address[] userList;
    uint index;

    //관리자
    address payable owner;
    //관리자 설정 (송금 받을 수 있는)
    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable{}

    function enterRoom() public payable{
        require(msg.value==1000000000000000000);
        // require(roomList.length < 3);
        users[msg.sender].score+=4-roomList.length;
        roomList.push(msg.sender);
      
        if(roomList.length == 4){
            delete roomList;
        }
         
    } 

    //사용자 point 변환 10점 마다 5wei
    // function getMoney() public payable{
    //     require(users[msg.sender].score > 10);
    //     uint s = users[msg.sender].score % 10;
    //     uint amount = users[msg.sender].score / 10 * 10**5;
    //     users[msg.sender].score = s;
    //     payable(msg.sender).transfer(amount);
       
    // }

    function getMoney(uint _amount) public{
        uint amount = users[msg.sender].score/10;
        require(amount >= _amount);
        users[msg.sender].score -= _amount*10;
        payable(msg.sender).transfer(_amount*10**5);

    }
    
    //관리자만 출금 가능 
    function withdraw(uint _amount) public {
        require(msg.sender == owner);
        owner.transfer(_amount);
    } 

    function setUser(string memory _name) public{

        users[msg.sender] = user(index++,_name,address(msg.sender),address(msg.sender).balance,0);
        userList.push(msg.sender);

    }

    function getUser(address _a) public view returns(uint num, string memory name, uint bal, uint score){
        return(users[_a].num, users[_a].name, users[_a].bal, users[_a].score);
    }

    function getAllUser() public view returns(address[] memory){
        // for(uint i =0;i<userList.length;i++){
        //     return(users[userList[i]].num, users[userList[i]].name, users[userList[i]].bal, users[userList[i]].score);
        // }

        return userList;
        
    }
}