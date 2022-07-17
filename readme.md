Before use this application, please install MySQL on localhost and setting .env for connection

1. Open ATM project folder
2. Install mysql in docker (install docker for PC), open Terminal and run:
    # Windows
        Open command prompt
        Type `run.cmd`
    # Linux
        Open Linux terminal
        Type `run.sh`
    Or if you don't want to install docker for PC, please install mysql first and set default password 123123
3. Open terminal in vscode
4. Install all packages by run 
    `$ npm install`
5. Create database MySql by running this command
    `$ npx sequelize db:create`
6. Create tables by running this command
    `$ npx sequelize db:migrate`
7. Create record in table transactiontype by run 
    `$ npx sequelize-cli db:seed:all`
8. Run js by running this command
    `$ npm run start`
9. Choose 1 for login, 2 for register new account.
   I already create username & password for test
   Sample username & password:
   `Username = Alice, Password = 1234`
   `Username = Bob, Password = 2345`
10. Insert username & password, if invalid the you may create new user with this application
11. After create user/login than choose menu that you want to you use regarding case below
        

Run this schema  # ATM

## Problem Statement
You are asked to develop a Command Line Interface (CLI) to simulate an interaction of an ATM with a retail bank.

## Commands

* `login [name]` - Logs in as this customer and creates the customer if not exist
* `deposit [amount]` - Deposits this amount to the logged in customer
* `withdraw [amount]` - Withdraws this amount from the logged in customer
* `transfer [target] [amount]` - Transfers this amount from the logged in customer to the target customer
* `logout` - Logs out of the current customer


## Example Session
Your console output should contain at least the following output depending on the scenario and commands. But feel free 
to add extra output as you see fit.

```bash
Sample username & password:
Username = Alice, Password = 1234
Username = Bob, Password = 2345


$ login Alice
Hello, Alice!
Your balance is $0

$ deposit 100
Your balance is $100 

$ logout
Goodbye, Alice!


$ login Bob
Hello, Bob!
Your balance is $0

$ deposit 80
Your balance is $80 

$ transfer Alice 50
Transferred $50 to Alice
your balance is $30 

$ transfer Alice 100
Transferred $30 to Alice
Your balance is $0
Owed $70 to Alice

$ deposit 30 
Transferred $30 to Alice
Your balance is $0
Owed $40 to Alice

$ logout
Goodbye, Bob!

$ login Alice
Hello, Alice!
Your balance is $210
Owed $40 from Bob

$ transfer Bob 30 
Your balance is $210
Owed $10 from Bob

$ logout
Goodbye, Alice!



$ login Bob

Hello, Bob!

Your balance is $0

Owed $10 to Alice



$ deposit 100

Transferred $10 to Alice

Your balance is $90



$ logout

Goodbye, Bob!

```
