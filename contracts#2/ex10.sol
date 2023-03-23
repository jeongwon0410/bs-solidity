pragma solidity 0.8.12;

contract A {
    enum Class {spades, diamonds, heats, clovers}
    enum Value {Ace, two, three, four, five, six, seven, eight, nine, ten,J,Q,K}

    struct Card{
        Class class;
        Value value;
    }   

    Card card;

    function setCard(Class _class, Value _value) public returns(Class,Value){
        card.class = _class;
        card.value = _value;

        return(card.class, card.value);
    }

    function setCard1(Class _class, Value _value) public returns(Card memory){
        card.value = _value;
        card.class = _class;

        return card;
    }
}

contract B {
    enum Status {turnedOff, trunOn,parking, stop, driving, outOfGas}
    Status status;

    constructor(){
        status = Status.turnedOff;
    }

    function getStatus() public view returns(Status){
        return status;
    }

    function parking() public {
        status = Status.parking;
    }

    function drive() public {
        status = Status.driving;
    }
}

contract C {
    enum Status{available, lended, reserved, recovery, missed}

    struct Book{
        uint number;
        string title;
        address lender;
        Status status;
    }

    struct User{
        string name;
        uint borrowed;
        uint miss_count;
    }

    uint index=1;
    mapping(string => Book) books;
    mapping(address => User) users;
    function setBook(string memory _title) public {
        books[_title] = Book(index++,_title,address(0),Status.available);
    } 

    function getBook(string memory _title) public view returns(Status){
        return books[_title].status;
    }

    function setUser(string memory _name) public {
        users[msg.sender] = User(_name,0,0);
    }

    function getUser(address _addr) public view returns(User memory){
        return users[_addr];
    }

    function getBook1(string memory _title) public view returns(Book memory){
        return books[_title];
    }

    //책 빌리기
    function lendBook(string memory _title) public {
        require(users[msg.sender].miss_count <=3 && Status.available == books[_title].status);
        books[_title].status = Status.lended;
        books[_title].lender = msg.sender;
        users[msg.sender].borrowed++;
    }


    //분실신고
    function missBook(string memory _title) public {
        require(books[_title].lender == msg.sender);
        books[_title].status = Status.missed;
        users[msg.sender].miss_count++;
    } 

    //반납
    function returnBook(string memory _title) public {

        require(books[_title].lender == msg.sender);
        books[_title].status = Status.available;
        books[_title].lender = address(0);
        users[msg.sender].borrowed--;
    }




}