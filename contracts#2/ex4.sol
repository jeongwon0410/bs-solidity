/*
1 - Alice (관리자)
2 - Bob
3 - Charlie
4 - Dwayne

1,2,3,4 // 1,2,3,4 // 1,2,3,4 -> 3라운드돌리고
각각의 점수 확인
getBalance로 contract 잔고 확인

Alice getMoney로 2 시도(오류 확인) // 1시도
1시도 후 점수 감소 확인, getBalance 감소 확인
withdraw로 인출해보기, getBalance 감소 확인
*/

contract A {
    struct user {
        uint number;
        string name;
        address addr;
        uint balance;
        uint score;
        bool include;
    }
    mapping(address => user) users;
    address[] room;

    // 관리자 주소
    address payable owner;
    // 관리자 최초 배포자로 설정
    constructor() payable {
        owner = payable(msg.sender);
    }

    uint index;
    function setUser(string memory _name) public {
        users[msg.sender] = user(index++, _name, msg.sender, msg.sender.balance, 0,false);
    }

    function getUser(address _a) public view returns(uint, string memory, address, uint, uint) {
        return(users[_a].number, users[_a].name, users[_a].addr, users[_a].balance, users[_a].score);
    }

    // contract가 받아야 하므로 payable
    function enterRoom() public payable {
        require(msg.value==1000000000000000000 && users[msg.sender].include == false);
        room.push(msg.sender);
        users[msg.sender].include = true;
        if(room.length ==4) {
            for(uint i=4; i >0; i--) {
                users[room[i-1]].score += 5-i;
                users[room[i-1]].include = false;
                room.pop(); //delete와 gas값 비교
            }
        }
    }

    // 관리자만 출금할 수 있는 출금 함수
    function withdraw(uint _amount) public {
        require(msg.sender == owner);
        owner.transfer(_amount);
        // 지갑.transfer(얼마)
    }

    // 사용자들 point 변환
    // 10점마다 0.05ETH (10점마다 5만큼)
    function getMoney(uint _a) public {
        uint a = users[msg.sender].score/10; // 점수 계산
        require(a >= _a); // 가능한 금액과 요청한 금액 비교
        users[msg.sender].score -= _a*10; // 점수 삭감
        payable(msg.sender).transfer(_a*5*10000000000000000);// 지급
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    // function getUser() public view returns(uint){

    // }
}