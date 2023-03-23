pragma solidity 0.8.0;

contract A {
    //함수에 payable은 컨트랙에게 돈을 송금 
    //payable 송금
    //돈 받는 애에게 payable 붙여줌 
    address payable owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable{} //컨트랙트주소가 받음

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function getMyBalance() public view returns(uint){
        return address(msg.sender).balance;
    }
    // 스마트컨트랙트가  _to 지갑주소
    function transfer(address payable _to, uint _amount) public {
        _to.transfer(_amount);
    }

    // 위의 transfer와의 차이, smart contract 한테 입금 가능여부
    function transferTo2(address payable _to, uint _amount) public payable{
        _to.transfer(_amount); // _to한테 _amount만큼 전송해줘
    } //value에 넣는다 


}