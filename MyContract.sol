pragma solidity ^0.6.0;

contract MyContract {
   // data types
   uint myValue = 0;
   // we have int, uint256, uint8
   // string
   string public myString = "Hello africa";

    // address data types
    // this is the address of a blockchain
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // you create custom data structure with struct

    struct MyStruct {
        uint id;
        string name;
        string email;
        uint age;
    }

    MyStruct public sample = MyStruct(1, "Ayooluwa", "olifedayo94@gmail.com", 3);

    // array data type
    uint [] public myUintArray = [1,2,3,4,5];
    string [] public myStringArray = ["hello", "apple"];
    string [] public values;

    function addValue(string memory _value) public {
        values.push(_value);
    }

    struct Book {
        string title;
        string author;
    }

    // mapping
    mapping(uint => string) public names;
    mapping(uint => MyStruct) public users;
    mapping(address => mapping(uint => Book)) public myBooks;

    constructor() public {
        names[1] = "Adams";
        names[2] = "Ayo";
        names[3] = "Tunji";
    }

    // add new details to db usiung mapping (note that blockchain is an open ledger db
    function addUser(uint _id, string memory _name, string memory _email, uint _age) public{
        users[_id] = MyStruct(_id, _name, _email, _age);
    }

    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
    // local variables  does not need public modifier

}