pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employeeOne; // ceo
    address payable employeeTwo; // cto
    address payable employeeThree; // bob

    constructor(address payable _one, address payable _two, address payable _three) public {
        employeeOne = _one;
        employeeTwo = _two;
        employeeThree = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // Calculate and transfer the distribution percentage
        // Set amount to equal `points` * the number of percentage points for this employee
        amount = points * 60;
        // Add the `amount` to `total` to keep a running total
        total += amount;
        // Transfer the `amount` to the employee
        employeeOne.transfer(amount);
        
        // Repeat for employeeTwo and employeeThree
        amount = points * 25;
        total += amount;
        employeeTwo.transfer(amount);
        
        amount = points * 15;
        total += amount;
        employeeThree.transfer(amount);
        
        // CEO gets the remaining wei and keeps the contract balance at 0
        employeeOne.transfer(msg.value - total); 
    }

    function() external payable {
        deposit();
    }
}
