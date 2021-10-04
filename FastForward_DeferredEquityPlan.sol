pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    uint fakeNow = now;
    address human_resources;

    address payable employee; // bob
    bool active = true; // this employee is active at the start of the contract

    // Set the total shares and annual distribution
    uint totalShares = 1000;
    uint annualDistribution = 250;

    uint startTime = fakeNow; // permanently store the time this contract was initialized

    // Set the `unlock_time` to be 365 days from now
    uint unlockTime = fakeNow + 365 days;

    uint public distributedShares; // starts at 0

    constructor(address payable _employee) public {
        human_resources = msg.sender;
        employee = _employee;
    }

    function distribute() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active.");
        require(unlockTime <= fakeNow, "Your shares are still locked");
        require(distributedShares < totalShares, "All shares have already been distributed");

        // Add 365 days to the `unlock_time`
        unlockTime += 365 days;

        // Calculate the shares distributed by using the function (now - start_time) / 365 days * the annual distribution
        distributedShares = (fakeNow - startTime) / 365 days * annualDistribution;

        // double check in case the employee does not cash out until after 5+ years
        if (distributedShares > 1000) {
            distributedShares = 1000;
        }
    }

    // human_resources and the employee can deactivate this contract at-will
    function deactivate() public {
        require(msg.sender == human_resources || msg.sender == employee, "You are not authorized to deactivate this contract.");
        active = false;
    }

    // Since we do not need to handle Ether in this contract, revert any Ether sent to the contract directly
    function() external payable {
        revert("Do not send Ether to this contract!");
    }
    
    function fastforward() public {
    fakeNow += 366 days;
    }

}
