pragma solidity 0.8.0;

contract C{
    enum Status {available, lended, maintenance, missed}

    struct Book{
        uint number;
        string title;
        address lender;
        address[] waitlist;
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
        books[_title] = Book(index++,_title,address(0),new address[](0),Status.available);
    }

    function getBook(string memory _title) public view returns(Book memory){
        return books[_title];
    }

    function setUser(string memory _name) public {
        users[msg.sender] = User(_name,0,0);
    }

    function getUser(address _addr) public view returns(User memory){
        return users[_addr];
    }

    function lendBook(string memory _title) public{
        require(users[msg.sender].miss_count <= 3 && books[_title].status == Status.available);
        books[_title].status = Status.lended;
        books[_title].lender = msg.sender;
        users[msg.sender].borrowed++;
    }

    function autoLending(string memory _title) public {
        require( books[_title].status == Status.available);
        books[_title].status = Status.lended;
        books[_title].lender = books[_title].waitlist[0];
        users[books[_title].waitlist[0]].borrowed++;

        for(uint i=1; i<books[_title].waitlist.length; i++) {
            books[_title].waitlist[i-1]  = books[_title].waitlist[i];
        }

        books[_title].waitlist.pop();
        books[_title].status = Status.lended;
        
    }


    function returnBook(string memory _title) public {
        require(books[_title].lender == msg.sender && books[_title].status == Status.lended);
        books[_title].status = Status.available;
        books[_title].lender = address(0);
        users[msg.sender].borrowed--;

        if(books[_title].waitlist.length>0){
            autoLending(_title);
        }
    }

    function reportBook(string memory _title) public {
        require(books[_title].lender == msg.sender);
        books[_title].status = Status.missed;
        users[msg.sender].miss_count++;
    }

    function reserveBook(string memory _title) public{
        require(books[_title].status == Status.lended && users[msg.sender].miss_count <= 3 && books[_title].waitlist.length < 3);
        books[_title].waitlist.push(msg.sender);

    }

 

}