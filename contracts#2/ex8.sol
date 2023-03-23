pragma solidity 0.8.0;

contract A {
    bytes32 pw;
    
    constructor(){
        pw = makePW(0,4,2,9);
    }
    
    function makePW(uint _a, uint _b, uint _c, uint _d) public returns(bytes32) {
        return keccak256(abi.encodePacked(_a,_b,_c,_d));
    }

    bytes32 pw2;
    function makePW2() public returns(bool, uint, uint){
        for(uint i=0;i<10;i++){
            for(uint j=0;j<10;j++){
                pw2 =  keccak256(abi.encodePacked(uint(0),uint(4),i,j));
                // pw2 = makePW(0,4,i,j);
                if(pw2 == pw){
                    return (true, i,j);
                }
            }
        }
    }

    function getPW() public view returns(bytes32){
        return pw;
    }    

}


contract abiencodePackedExample{
    function abisample(uint _a, uint _b) public view returns(bytes32){
        return keccak256(abi.encodePacked(_a,_b));
    }

    function abisample2() public view returns(bytes32){
        return keccak256(abi.encodePacked(uint(1),uint(2)));
    }

    function getLen(uint _num) public view returns(uint){
        uint i;
        while(true){
            
            _num = _num/10;
            i++;
            if(_num == 0){
                break;
            }
        }

        return i;
    }

    uint[] numbers;

    function divideNumber(uint _num) public returns(uint[] memory){
        while(true){
            numbers.push(_num%10);
            _num = _num/10;
            
            if(_num == 0){
                break;
            }
        }

        return numbers;
    } 

    uint[] numbers_r;
    function reverse() public returns(uint[] memory){
        uint len = numbers.length;
        for(uint i =0;i<len;i++){
            numbers_r.push(numbers[numbers.length-1]);
            numbers.pop();
        }

        return numbers_r;
    }

    function reverse1() public returns(uint[] memory){
        for(uint i =numbers.length;i>0;i--){
            numbers_r.push(numbers[i-1]);
        }

        return numbers_r;
    }

    function reverse2() public returns(uint[] memory) {
        for(uint i; i<numbers.length/2; i++) {
            uint a; // 잠깐 저장해줄 아이
            a = numbers[i];
            numbers[i] = numbers[numbers.length-i-1];
            numbers[numbers.length-i-1] = a;
        }

        return numbers;
    }


} 