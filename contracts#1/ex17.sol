pragma solidity 0.8.0;

contract A {
    struct poll {
        uint number;
        string title;
        string contents;
        address by;
        uint agree;
        uint disag;
    }

    mapping(string => poll) polls;
    uint index;

    struct user {
        string name;
        string[] poll_list;
        mapping(string => bool) voted; // 문제
    }

    mapping(address => user) users;

    function getPoll(string memory _title) public view returns(string memory, string memory,address, uint, uint){
        return (polls[_title].title,polls[_title].contents,polls[_title].by ,polls[_title].agree , polls[_title].disag);
    }

    // function getAllPoll() public view returns(poll[] memory){ //가볍지 않아서 memory 붙여줌
    //     return Polls;
    // }

    function setPoll(string memory _title, string memory _contents) public {
        polls[_title].number++;
        polls[_title].title = _title;
        polls[_title].contents = _contents;

        //  polls[_title] = poll(index++, _title, _contents, msg.sender, 0,0);
    }

    function setUser(string memory _name) public {
        users[msg.sender].name = _name;
    }

    function getUser() public view returns(string memory,uint ){
        return(users[msg.sender].name,users[msg.sender].poll_list.length);
    }

    function getUser2(string memory _title) public view returns(bool){
        return(users[msg.sender].voted[_title]);
    }

    function vote(string memory _title, bool _b) public {
        if(_b){
            polls[_title].agree++;
        }else{
            polls[_title].disag++;
        }
        users[msg.sender].voted[_title] = _b;
    }
}

