pragma solidity 0.8.12;

contract A {

    enum Grade{
        A,
        B,
        C
    }

    Grade grade;


    function setA() public{
        grade = Grade.A;
    }

    function setB() public{
        grade = Grade.B;
    }


    function setC() public{
        grade = Grade.C;
    }


    function getGrade() public view returns(Grade){
        return grade;
    }

}

contract B{
    enum Class { spades, clovers, diamonds, hearts}
    enum Value {Ace, two, three, four, five, six, seven, eight, nine, ten, J,Q,K}

    struct Card {
        Class cls;
        Value vl;
    }

    Card card;

    function setCard(Class _cls, Value _vl) public {
        card.cls = _cls;
        card.vl = _vl;
    }

    function getCard() public returns(Card memory){
        return card;
    }
}

contract C{
    enum Status {available, lended, reserved, maintenance, missed}

    struct Book{
        uint number;
        string title;
        address lender;
        Status status;
       
    }

    mapping(string => Book) books;

    struct User{
        string name;
        uint borrowed;
        uint miss_count;
    }
    mapping(address => User) users;

    uint index = 1;

    function setBook(string memory _title) public {
        books[_title] = Book(index++,_title,address(0),Status.available);
    }

    function getBook(string memory _title) public view returns(Book memory){
        return books[_title];
    }

    function setUser(string memory _name) public {
        users[msg.sender] = User(_name,0,0);
    }

    function lendBook(string memory _title) public{
        require(users[msg.sender].miss_count <= 3 && books[_title].status == Status.available);
        books[_title].status = Status.lended;
        books[_title].lender = msg.sender;
        users[msg.sender].borrowed++;
    }



    function returnBook(string memory _title) public {
        require(books[_title].lender == msg.sender && books[_title].status == Status.lended);
        books[_title].status = Status.available;
        books[_title].lender = address(0);
        users[msg.sender].borrowed--;
    }

    function reportBook(string memory _title) public {
        require(books[_title].lender == msg.sender);
        books[_title].status = Status.missed;
        users[msg.sender].miss_count++;
    }


}