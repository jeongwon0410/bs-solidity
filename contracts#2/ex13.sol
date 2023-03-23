pragma solidity 0.8.12;

contract A {
    string a;
    function setString(string memory _a) public {
        a = _a;
    }


    function getString() public view returns(string memory){
        return a;
    }


    function getBytes() public view returns(bytes memory){
        return bytes(a);
    }

    function getBytes1() public view returns(bytes1, bytes2){
        return (bytes(a)[0],bytes(a)[1]);
    }

    function getBytes2() public view returns(bytes1, bytes1){
        return (bytes(a)[0],bytes(a)[1]);
    }

    function getPart(uint _a, uint _from, uint _to, string memory _s) public view returns(bytes memory){
        require(_a == _to - _from+1);
        bytes memory part = new bytes(_a);
        uint a;
        for(uint i = _from;i<_to+1;i++){
            part[a] = bytes(_s)[i-1];
            a++;
        }

        return bytes(part);
    }

    function stringConcat(string memory _a, string memory _b) public view returns(string memory){
        return string.concat(_a,_b);
    }

    function getLen(string memory _a) public view returns(uint){
        return bytes(_a).length;
    }

    function findString(string memory _s1, string memory _s2) public  returns(bool){
        for(uint i =0;i<bytes(_s1).length-bytes(_s2).length+1;i++){
            bytes memory part = new bytes(bytes(_s2).length);
            uint a;
           
            for(uint j=i;j<bytes(_s2).length+i;j++){
                part[a] = bytes(_s1)[j];
                a++; 
            }

            //같음 !!
            // if(keccak256(part) == keccak256(bytes(_s2))){
            //     return true;
            // }

            // if(bytes32(part) == bytes32(_s2)){
            //     return true;
            // }
        }

        return false;
    }


    
}