pragma solidity 0.8.0;

contract A {
    bytes32 password;

    function getHash(string memory _a) public returns(bytes32){
        return keccak256(bytes(_a));
        
    }
    function setPassword(uint _password) public{
        password = keccak256(abi.encodePacked(_password));     
    }

    function verifyPassword(uint _password) public view returns(uint){
        if(password == keccak256(abi.encodePacked(_password))){
            return _password;
        }
    }

    function getPassword() public view returns(uint){
        uint pw1 = 400;
        uint pw2;
        for(uint i =0;i<10;i++){
            for(uint j =0;j<10;j++){
                pw2 = i+j;
                if(password == keccak256(abi.encodePacked(pw1+pw2))){
                    return pw2;
                }
                // verifyPassword(pw1+pw2);
            }   
        }

    }
}