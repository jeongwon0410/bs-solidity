// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.0;

contract A {
    struct agenda{
        uint num;
        string subject;
        string contents;
        address proposer;
        uint positive_num;
        uint negative_num;
    }

    agenda[] Agenda;

    struct user{
        string name;
        string[] make_agenda;
        mapping(string => bool) voted;
    }

    mapping(address => user) User;


    function hash(string memory _s) public returns(bytes32){
        return keccak256(bytes(_s));
    }

    function setAgenda(string memory _subject, string memory _contents) public {
        Agenda.push(agenda(Agenda.length+1,_subject,_contents,msg.sender,0,0));
        User[msg.sender].make_agenda.push(_subject);
    }

    function getAgenda(uint _n) public view returns(string memory _subject, string memory _contents, address _proposer){
        return (Agenda[_n].subject,Agenda[_n].contents,Agenda[_n].proposer);
    }


    function getAgendaVoted() public view returns(uint, uint){
        uint p_sum;
        uint n_sum;
        for(uint i=0;i<Agenda.length;i++){
            p_sum = Agenda[i].positive_num + p_sum;
            n_sum = Agenda[i].negative_num + n_sum;
        }

        return (p_sum,n_sum);

    }

    function setUser(string memory _name) public {
        User[msg.sender].name = _name;
        
        
    }

    function Vote(string memory _subject, bool _b) public {
        for(uint i=0;i<Agenda.length;i++){
            if(hash(Agenda[i].subject) == hash(_subject)){
                if(_b){
                    Agenda[i].positive_num++;
                }else{
                    Agenda[i].negative_num++;
                }
                
            }
        }

        User[msg.sender].voted[_subject] = _b;

    }
}