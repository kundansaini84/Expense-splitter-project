Explanation of the Smart Contract:
## Metadata:

projectTitle, projectDescription, projectVision, futureScope, and keyFeatures are public variables that describe the project and its purpose. These are read-only variables, so anyone interacting with the contract can view them.
Structs and Mappings:

Expense struct is used to store each expense's details like the description, amount, participants, and their shares. It also tracks whether the expense has been settled.
expenses array stores all the expenses that have been created.
balances mapping stores each participant's balance (what they owe or are owed).
Functions:

createExpense(): Allows users to create an expense, providing a description, amount, and participants. It calculates the share for each participant and adds it to their balance.
payShare(): Allows a participant to pay their share for a particular expense. The correct amount must be sent with the transaction.
checkBalance(): Allows participants to check how much they owe or are owed.
getProjectDetails(): Returns all project-related details like the title, description, vision, future scope, and key features.
## Future Scope:
Integration with payment gateways for real-time payments.
Enhanced user interface and experience.
Advanced features like expense categorization and automatic reminders.
This contract is a basic implementation for group purchase splitting. It can be further enhanced to support more complex scenarios like partial payments, multiple expenses per participant, and more advanced accounting mechanisms.

## contract address: 
0x4ED246e65fb731aB41318b59952009B60109a13A

![image](https://github.com/user-attachments/assets/097340e9-2f9a-40cf-93ee-681b5a43c368)

## frontend
![image](https://github.com/user-attachments/assets/790cc63f-503f-4e3d-a95c-8f3ac7b0afc6)

