// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExpenseSplitter {
    string public projectTitle = "Expense Splitter for Group Purchases";
    string public projectDescription = "Effortlessly split group purchases with our Expense Splitter automatically divide costs and track everyones share, making payments simple and fair for all.";
    string public projectVision = "To create a seamless and transparent way for groups to split expenses fairly and easily, promoting trust and reducing conflicts in group purchases.";
    string public futureScope = "Integration with payment gateways for direct transfers, enhanced user interface, and scalability to support larger groups with advanced features like expense categorization.";
    string public keyFeatures = "1. Automatic calculation of shares. 2. Transparent expense tracking. 3. Support for multiple participants. 4. Ability to settle payments on the blockchain for transparency.";

    struct Expense {
        string description;
        uint256 amount;
        address[] participants;
        mapping(address => uint256) shares;
        bool isSettled;
    }

    Expense[] public expenses;
    mapping(address => uint256) public balances;

    // Event to log when an expense is created
    event ExpenseCreated(uint256 expenseId, string description, uint256 amount, address[] participants);
    // Event to log when a payment is made
    event PaymentMade(address payer, uint256 amount);

    // Function to create a new expense
    function createExpense(string memory description, uint256 amount, address[] memory participants) public {
        uint256 expenseId = expenses.length;
        Expense storage newExpense = expenses.push();

        newExpense.description = description;
        newExpense.amount = amount;
        newExpense.participants = participants;

        uint256 share = amount / participants.length;
        for (uint256 i = 0; i < participants.length; i++) {
            newExpense.shares[participants[i]] = share;
            balances[participants[i]] += share;
        }

        emit ExpenseCreated(expenseId, description, amount, participants);
    }

    // Function to pay a share of an expense
    function payShare(uint256 expenseId) public payable {
        require(expenseId < expenses.length, "Expense does not exist");
        Expense storage expense = expenses[expenseId];

        uint256 share = expense.shares[msg.sender];
        require(msg.value == share, "Incorrect payment amount");

        balances[msg.sender] -= share;
        expense.isSettled = true;

        emit PaymentMade(msg.sender, msg.value);
    }

    // Function to check the balance of a participant
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Function to view the project details
    function getProjectDetails() public view returns (string memory, string memory, string memory, string memory, string memory) {
        return (projectTitle, projectDescription, projectVision, futureScope, keyFeatures);
    }
}
