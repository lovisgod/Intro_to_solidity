pragma solidity ^0.6.0;

contract HotelRoom {
    // specify the payable address
    // this is who the payment is sent to whenever we book the hotel

    address payable public owner;

    // status of the room if it's vacant or not

    enum Status { Vacant, Occupied }

    Status currentStatus;

    event Occupy(address _occupant, uint _value);

    constructor()  public {
        // since constructor is called only when the contract is deployed,
        // msg.sender in the constructor function is the person that deployed the contract
        // which is the owner of the contract.
        owner = msg.sender;

        // set default status of the room
        currentStatus = Status.Vacant;
    }

    modifier onlyWhileVacant {
        require(currentStatus == Status.Vacant, "Room currently occupied");
        _; // this runs the next function after the require is ran
    }

    modifier cost(uint _amount){
        require(msg.value >= _amount, "Not Enough Ether provided");
        _; // this runs the next function after the require is ran
    }

    receive() external payable onlyWhileVacant cost(2 ether) {
        owner.transfer(msg.value);
        currentStatus = Status.Occupied;
        emit Occupy(msg.sender, msg.value); 
        // the sender here is the person calling the book method from the public
    }
}