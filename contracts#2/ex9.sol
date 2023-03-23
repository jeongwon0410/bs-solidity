pragma solidity 0.8.12;

contract A {

    string a;

    function setString(string memory _a) public {
        a = _a;
    }

    function get() public view returns(string memory){
        return a;
    }

    function getBytes() public view returns(bytes memory){
        return bytes(a);
    }

    function getBytes2() public view returns(bytes1, bytes2, bytes3){
        return (bytes(a)[0],bytes(a)[1],bytes(a)[2]);

    }

    function getBytes3() public view returns(bytes1, bytes1, bytes1){
        return (bytes(a)[0],bytes(a)[1],bytes(a)[2]);
    
    }

    function getFirst(string memory _a) public view returns(string memory){
        bytes memory first = new bytes(1);
        first[0] = bytes(_a)[0];
        return (string(first));
    }


    function getFirst1(string memory _a) public view returns(string memory){
        bytes memory first = new bytes(2);
        first[0] = bytes(_a)[0];
        first[1] = bytes(_a)[1];
        return (string(first));
    }


    function getSecond(string memory _a) public view returns(string memory){
        bytes memory first = new bytes(1);
        first[0] = bytes(_a)[1];
        return (string(first));
    }


    function getSecond1(string memory _a) public view returns(bytes memory, string memory){
        bytes memory first = new bytes(1);
        first[0] = bytes(_a)[1];
        return (first , string(first));
    }

    function getPart(uint _a, uint _from, uint _to, string memory _s) public view returns(string memory){
        bytes memory first = new bytes(_a);
        require(_a == _to - _from +1);
        uint index;
        for(uint i =_from-1;i<_to;i++){
            first[index++] = bytes(_s)[i];
        }
        return (string(first));
    }

    function stringConcat(string memory _a, string memory _b) public view returns(string memory){
        return (string.concat(_a,_b));
    }

    function getLen1(string memory _a) public view returns(uint){
        return bytes(_a).length;
    }

}