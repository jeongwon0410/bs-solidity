pragma solidity 0.8.0;

contract A {
    address payable owner;

    function deposit() public payable{}


    function deposit2(address payable _to, uint _amount) public{
        _to.transfer(_amount);
    }

    
    function deposit2_1(address payable _to, uint _amount) public payable{
        _to.transfer(_amount);
    }

    function deposit3() public payable returns(uint){
        return msg.value;
    }

    //솔리디티에서 msg.value를 건들이지 못함 => user가 value를 입력하지 않고도 돈을 송금 할 수 있어야 함 (자기가 자기를 변경 시키려 하기때문에)
    function deposit4(uint _amount) public payable {
        payable(address(this)).transfer(_amount);
    }

    function deposit5() public payable{
        payable(address(this)).transfer(10**18);
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}