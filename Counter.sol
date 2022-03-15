pragma solidity ^0.6.0;

contract Counter {
    uint public count = 0; // count is an example of a state variable


    // public makes it calable from outside the contract e.g from a browser
    // view means it's use is to view or observe a variable
    // returns tells the type of data it returns
    // function getCount() public view returns(uint) {
    //     return count;
    // }

    // this function update the state variable "count"
    function incrementCount() public {
        count = count + 1;
    }
}