pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.

    // Public variables
    address payable public employeeOne;
    address payable public employeeTwo;
    address payable public employeeThree;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employeeOne = _one;
        employeeTwo = _two;
        employeeThree = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        //Split `msg.value` into three
        uint amount = msg.value / 3;

        //Transfer the amount to each employee
        employeeOne.transfer(amount);
        employeeTwo.transfer(amount);
        employeeThree.transfer(amount);

        // take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value - (amount * 3));
    }

    function() external payable {
        // Enforce that the `deposit` function is called in the fallback function!
        deposit();
    }
}
