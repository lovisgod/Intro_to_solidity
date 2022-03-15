pragma solidity ^0.6.0;

contract ConditionalContract {

    address public owner;

    constructor() public {
        owner = msg.sender;
    }
  
  function isEvenNumber(uint _number) public pure returns(bool) {
      if (_number % 2 == 0) {
          return true;
      } else {
          return false;
      }
  }

  function isOwner() public view returns(bool) {
      return msg.sender == owner;
  }

}