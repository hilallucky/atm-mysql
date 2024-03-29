const express = require('express')
const { request, response } = express()
const middlewaresCheck = require('../helper/account')
const middlewaresCheckBalance = require('../helper/balance')
const promptSchemasNew = require('./prompt_schemas')
colors = require('colors');
const prompt = require('prompt');
const e = require('express');
// const { valid } = require('joi');

prompt.start();
prompt.message = "";
prompt.delimiter = " ";

let data, validate

let account_no, account_no_to, fullname;

promptWelcome();

function promptWelcome() {
  clearScreen();
  prompt.get(promptSchemasNew.defaultSchema, welcomeMenuCallback.bind(this));
};

function welcomeMenuCallback(err, choice) {
  if (err) { return; }
  console.log("\n\n");
  switch (choice["default screen"]) {
    case "1":
      //Show Login
      promptLogin();
      break;
    case "2":
      //Register New Account
      registerNewAccount()
      break;
  }
};


function promptLogin() {
  clearScreen();

  let d = Date.now();
  prompt.get(promptSchemasNew.loginSchema, async function (err, result) {
    if (err) { return onErr(err); }
    let data = await promptSchemasNew.loginSchema.properties.password.validate({ username: result.username, password: result.password })
    // console.log('data  = ' +JSON.stringify(data))
    if (!data) {
      console.log(' Invalid Username: ' + result.username);
      registerNewAccount()
    } else {
      clearScreen();
      fullname = data.userLogin.firstname + ' ' + data.userLogin.middlename + ' ' + data.userLogin.lastname

      printToScreen(true, fullname, data.userLogin.account_no, data.balance.amountbalance, data.balance.amount_receivable, data.balance.amount_ow);
      account_no = data.userLogin.account_no
      fullname = fullname
      promptAnotherTransaction()
    }

  });
}

// promptLogin();

function registerNewAccount() {
  clearScreen();
  prompt.get(promptSchemasNew.userRegistration, async function (err, result) {
    if (err) { return onErr(err); }
    let data = await promptSchemasNew.userRegistration.properties.verifypassword.validate({
      firstname: result.firstname,
      middlename: result.middlename,
      lastname: result.lastname,
      id_no: result.id_no,
      username: result.username,
      password: result.password,
      amountbalance: result.deposit,
      amount_success: result.deposit
    })
    fullname = result.firstname + ' ' + result.middlename + ' ' + result.lastname
    if (data.status == false) {
      console.log(' Failed Add New Account: ' + result.firstname);
      new promptLogin()
    } else {

      printToScreen(true, fullname, account_no, balance, data.amount_receivable, data.amount_ow);
      account_no = data[0].insertNewAccount.account_no
      console.log('')
      promptAnotherTransaction()
    }

  });
}

async function checkBalance(printout, destination_account) {
  let totLoop = 0, account_nox, result = []
  if (destination_account != undefined) { totLoop = 1 }
  for (let funLoop = 0; funLoop <= totLoop; funLoop++) {
    account_nox = account_no
    if (destination_account != undefined) { account_nox = destination_account }
    data = await middlewaresCheckBalance().checkBalanceAccount({ accountno: account_nox })
    let balance, datax, amount_ow
    if (!data) {
      balance = 0
      datax = false
      if (printout == 1) {
        printToScreen(false, fullname, account_no, 0, 0, 0);
      }
    } else {
      balance = data.amountbalance, amount_ow = data.amount_ow
      datax = true
      if (printout == 1) {
        printToScreen(true, fullname, account_no, balance, data.amount_receivable, amount_ow);
      }
    }


    if (funLoop == 0) { result.push({ datax: datax, balance: data }) }
  }
  return result[0];

};

function printToScreen(
  welcome = false,
  fullname,
  account_no,
  balance,
  amount_receivable,
  amount_ow
) {
  if (welcome) console.log('Welcome to ATM console:');
  console.log('  Name: ' + fullname);
  console.log('  Account No: ' + account_no);
  console.log(`  Amount:  ${valueNumber(balance)} `);
  console.log(`  Amount Receivable:  ${valueNumber(amount_receivable)} `);
  console.log(`  Amount Owe: ${valueNumber(amount_ow)}`);
}

function valueNumber(no) {
  return no ? no : 0;
}


async function updateBalance(params) {
  let totLoop = 0, account_nox,
    amount = params.amount,
    amount_ow = params.amount_ow,
    amount_success = params.amount_success,
    destination_account = params.destination_account,
    amount_receivable = params.amount_receivable
  let checkDataBalance;
  if (!destination_account && destination_account != undefined) { totLoop = 1 }
  for (let funLoop = 0; funLoop <= totLoop; funLoop++) {
    account_nox = account_no
    if (destination_account != undefined) {
      account_nox = destination_account
      checkDataBalance = await checkBalance(0, account_nox)
    } else {
      checkDataBalance = await checkBalance(0)
    }
    if (checkDataBalance.datax === false) {
      let data = await middlewaresCheckBalance().insertBalance({
        account: account_nox,
        trans_code: 0,
        amountbalance: amount,
        amount_ow: amount_ow,
        amount_receivable: amount_receivable,
        amount_success: amount_success
      })

    } else {
      let data = await middlewaresCheckBalance().updateBalance({
        account: account_nox, trans_code: 0,
        amountbalance: amount,
        amount_ow: amount_ow,
        amount_receivable: amount_receivable,
        amount_success: amount_success
      })
    }


    if (destination_account != undefined) {
      account_nox = destination_account
      checkDataBalance = await checkBalance(0, account_nox)
    } else {
      checkDataBalance = await checkBalance(1)
    }
  }
  return checkDataBalance

};


async function withdrawFunds(amount) {
  if (account_no) {
    var newBalance, amount_success = 0,
      balance = await checkBalance(0);
    if (balance.datax === false) {
      balance = await updateBalance({ amount: 0 });
      balance = 0
      return balance;
    } else {
      newBalance = balance.balance.amountbalance - amount;
      balance = await updateBalance({ amount: newBalance, amount_success: amount_success });
      return balance;
    }
  }
};

async function withdrawFundsCallback(err, amount) {
  console.log("\n\n\n\n\n\n\n\n");
  var withdrawalAmount = parseInt(amount["withdraw funds"], 10),
    balance = await withdrawFunds(withdrawalAmount)
  if (balance === null || balance === undefined) {
    balance = 0;
  }
  balanceString = "" + balance.toString(10).red;

  // console.log(balance);
  //LOG ERROR TO CONSOLE IF BALANCE ISN'T ENOUGH TO COVER REQUEST//
  //AND GIVE USER OPTION TO END SESSION//
  if (balance === "insufficient funds") {
    console.error("insufficient funds for requested transaction".red);
  }
  promptAnotherTransaction();
};


async function depositFunds(amount) {
  if (account_no) {
    var newBalance, amount_ow = 0, amount_success = 0, inserDataTrans = [],
      balance = await checkBalance(0);
    console.log('depositFunds amount:' + amount);
    if (balance.datax === false) {
      newBalance = 0 + amount;
      balance = await updateBalance({ amount: 0, amount_ow: 0 });
      balance = 0
      inserDataTrans.push({
        trans_date: new Date(),
        trans_code: '0',
        account_source: account_no,
        account_destination: account_no,
        amount: amount,
        amount_owe: 0,
        amount_success: amount,
        amount_balance: newBalance,
        amount_balance_start: newBalance
      })
      await middlewaresCheckBalance().insertTransaction(inserDataTrans)
      // console.log("balance0 "+balance)

      return balance
    } else {
      newBalance = balance.balance.amountbalance + amount;
      amount_success = amount;

      inserDataTrans.push({
        trans_date: new Date(),
        trans_code: '0',
        account_source: account_no,
        account_destination: account_no,
        amount: amount,
        amount_owe: 0,
        amount_success: amount,
        amount_balance: newBalance,
        amount_balance_start: newBalance
      })

      await middlewaresCheckBalance().insertTransaction(inserDataTrans)
      let balance1 = await updateBalance({ amount: newBalance, amount_success: amount_success });
      return balance1;
    }

  }
  return "invalid session";
};

async function depositFundsCallback(err, amount) {
  if (err) { return; }
  console.log("\n\n\n\n\n\n");
  var depositAmount = parseFloat(amount["deposit funds"]),
    balance = await depositFunds(depositAmount);

  console.log("success! your new balance is: ".blue, balance.balance.amountbalance);
  promptAnotherTransaction();
};


async function transferFunds(destination_account, amount) {
  if (account_no) {
    var newBalanceSource,
      newBalanceDest = 0,
      balanceOw = 0,
      transferAmount = 0,
      amount_success = 0,
      inserDataTrans = [],
      validateDestinationAccount = await middlewaresCheck().runCHeck({ account_no: destination_account }),
      balance = await checkBalance(0),
      balance2 = await checkBalance(0, destination_account),
      balance_start = balance.balance.amountbalance,
      balance_start2 = balance2.balance.amountbalance,
      amount_receivable2 = balance2.balance.amount_receivable,
      amount_receivable = balance2.balance.amount_receivable;

    // console.log(`validateDestinationAccount == ${JSON.stringify(validateDestinationAccount)}`);

    if (!balance2.datax || balance2.datax === false || !validateDestinationAccount) {
      return { data: false, balance: balance.balance.amountbalance };
    } else {
      if (balance.datax !== false) {
        if (balance.balance.amountbalance === 0) {
          newBalanceSource = 0
          balanceOw = amount // * -1
          amount_receivable = 0
          amount_success = 0
        }
        let balancex = balance.balance.amountbalance - amount
        var amountNew = balance.balance.amountbalance
        // console.log('balancex transferFunds = '+JSON.stringify(balancex));
        if (balancex === 0) {
          newBalanceSource = 0
          balanceOw = 0
          if (balance.balance.amount_ow > 0) {
            balanceOw = (balance.balance.amount_ow - balance.balance.amountbalance) //* -1
          }
          amount_success = balance.balance.amountbalance
          amount_receivable = 0
        }
        if (balancex < 0) {
          newBalanceSource = 0
          if (balance.balance.amount_receivable > 0) {
            amount_receivable = balance.balance.amount_receivable - amount
          } else if (balance.balance.amount_receivable > 0 && balance.balance.amount_receivable - amount < 0) {
            amount_receivable = 0
            newBalanceSource = amount - balance.balance.amount_receivable + balance.balance.amount_receivable
          }
          balanceOw = -balancex
          if (balance.balance.amountbalance >= 0) {
            amount_success = balance.balance.amount_ow - balance.balance.amountbalance
          } else {
            amount_success = (balance.balance.amountbalance + amount) //*-1
          }
        }
        if (balancex > 0) {
          newBalanceSource = balancex
          if (balance.balance.amount_receivable > 0 && balance.balance.amount_receivable - amount < 0) {
            amount_receivable = 0
            newBalanceSource = amount - balance.balance.amount_receivable + balance.balance.amountbalance
          } else if (balance.balance.amount_receivable > 0 && balance.balance.amount_receivable - amount > 0) {
            amount_receivable = balance.balance.amount_receivable - amount
            newBalanceSource = balance.balance.amountbalance
          }
          balanceOw = 0
          if (balance.balance.amount_ow > 0 && balance.balance.amountbalance - amount >= 0) {
            amount_receivable = 0
          }
          amount_success = amount
        }
      }

      let amount_receivable_source = amount_receivable, amount_ow_source = balanceOw, amount_success_source = amount_success
      var amount_receivable_dest1 = balanceOw

      balance = await updateBalance({ amount: newBalanceSource, amount_receivable: amount_receivable_source, amount_ow: amount_ow_source, amount_success: amount_success_source });
      inserDataTrans.push({
        trans_date: new Date(),
        trans_code: 'd',
        account_source: account_no,
        account_destination: destination_account,
        amount: amount,
        amount_owe: balanceOw,
        amount_success: amount_success,
        amount_balance: newBalanceSource,
        amount_balance_start: balance_start
      })


      //DESTINATION

      if (balance2.datax !== false) {
        if (balance2.balance.amount_ow === 0) {
          newBalanceDest = balance2.balance.amountbalance + amount
          balanceOw = 0
          amount_success = amount
        }
        let balanceOwx = balance2.balance.amount_ow - amount

        if (balanceOwx === 0) {
          newBalanceSource = 0 //balance2.balance.amountbalance + amount
          balanceOw = 0
          amount_success = amount
        }
        if (balanceOwx < 0) {
          newBalanceDest = balance2.balance.amountbalance + amount
          if (balance.balance.amountbalance === 0) {
            newBalanceDest = 0 + balance2.balance.amountbalance;
          }
          if (balance.balance.amount_ow > 0) {
            newBalanceDest = balance2.balance.amountbalance + amountNew;
            // balanceOw = balance2.balance.amount_ow - amountNew
          }
          balanceOw = 0
          amount_success = amount
        }
        if (balanceOwx > 0) {
          newBalanceDest = 0
          balanceOw = balanceOwx
          amount_success = amount
        }
      }
      let account_destinationx;
      if (balanceOw > 0) {
        account_destinationx = account_no
      } else {
        account_destinationx = destination_account
      }

      let amount_receivable_dest = amount_receivable2, amount_ow_dest = balanceOw, amount_success_dest = amount_success
      if (amount_receivable_dest1 > 0 || amount_receivable_dest > 0) {
        amount_receivable_dest = amount_receivable_dest1
      }
      balance2 = await updateBalance({ amount: newBalanceDest, amount_receivable: amount_receivable_dest, amount_ow: amount_ow_dest, amount_success: amount_success_dest, destination_account: destination_account });
      inserDataTrans.push({
        trans_date: new Date(),
        trans_code: 'c',
        account_source: destination_account,
        account_destination: account_destinationx,
        amount: amount,
        amount_owe: balanceOw,
        amount_success: amount_success,
        amount_balance: newBalanceDest,
        amount_balance_start: balance_start2
      })
      let dataTrans = await middlewaresCheckBalance().insertTransaction(inserDataTrans)
      console.log(`  Transfer to Account : ${destination_account}, Name : ${validateDestinationAccount.userLogin.firstname ? validateDestinationAccount.userLogin.firstname : ''} ${validateDestinationAccount.userLogin.middlename ? validateDestinationAccount.userLogin.middlename : ''} ${validateDestinationAccount.userLogin.lastname ? validateDestinationAccount.userLogin.lastname : ''}, Amount: ${amount}`);

      return { data: true, balance: balance };

    }
    return { data: 'invalid session', balance: 0 };
  }
};

transferFundsCallback = async function (err, amount) {
  var withdrawalAmount = parseInt(amount["transfer amount"], 10),
    destination_account = amount["destinationAccount"]

  console.log("\n\n\n\n\n\n\n\n");
  if (destination_account == account_no) {
    console.log('Cannot transfer to self account!'.red);
  } else {
    var balance = await transferFunds(destination_account, withdrawalAmount)
    if (balance.balance === null || balance.balance === undefined) {
      balance.balance = 0;
    }
    balanceString = "" + balance.balance.toString(10).red;
    // console.log(balance);
    //LOG ERROR TO CONSOLE IF BALANCE ISN'T ENOUGH TO COVER REQUEST//
    //AND GIVE USER OPTION TO END SESSION//
    if (balance.balance === "insufficient funds") {
      console.error("insufficient funds for requested transaction".red);
    }

    if (!balance.data) {
      console.error('Invalid destination account'.red);
      console.error(`Transfer to Account : ${destination_account}, Amount: ${withdrawalAmount}, status: failed`.red);
      console.error(`Your existing amount now : ${balance.balance}`);
    }

  }
  promptAnotherTransaction();
};


async function printLedger() {
  let unformattedLedger,
    formattedLedger,
    _i,
    _length,
    entryArray,
    date,
    string;
  formattedLedger = [];
  let data = await middlewaresCheckBalance().transactionLedger({ account_source: account_no })
  if (data) {
    //LOOP THROUGH FORMAT AND PRINT EACH ENTRY//
    _length = data.length
    for (_i = 0; _i < _length; _i++) {
      entryArray = data[_i];
      date = data[_i].trans_date;
      string = new Date(date).toLocaleDateString() + " " + new Date(date).toLocaleTimeString() + "    " + entryArray.amount + "    " + entryArray.amount_balance
      formattedLedger.push(string);

      console.log(string.blue);
    }
  }
  else {
    console.log("no transactions yet!".blue);
  }
  return formattedLedger;
};


async function newPinCallback(err, choice) {
  if (err) { return; }
  newPin = choice["new pin"];
  console.log("\n\n");

  let data = await middlewaresCheck().updatePassword({ account_no: account_no, password: newPin })
  data = JSON.stringify(data)
  if (!data || data === undefined) {
    console.log("failed to change your password".red);
  } else {
    console.log("your password successfully changed!".blue);
  }

  promptAnotherTransaction();
};


function promptAnotherTransaction() {
  console.log("\n\n");
  prompt.get(promptSchemasNew.anotherTransaction, anotherTransactionCallback.bind(this));
};

function anotherTransactionCallback(err, choice) {
  if (err) { return; }
  var answer = choice["another transaction?"].toLowerCase();
  if (answer === "yes" || answer === "y") {
    transactionMenu();
  }
  else {
    console.log('Goodbye, ' + fullname + '!');
    process.exit(1);
  }
};

function transactionMenu() {
  clearScreen();
  console.log(promptSchemasNew.transactionMenu.properties["Transaction Menu"].menu);
  prompt.get(promptSchemasNew.transactionMenu, transactionMenuCallback.bind(this));
};

function transactionMenuCallback(err, choice) {
  if (err) { return; }
  //SLIGHT DELAY AFTER TRANSACTION BEFORE PROMPTING FOR ANOTHER TRANSACTION//
  var promptTimeOut = setTimeout(promptAnotherTransaction.bind(this), 1500);
  console.log("\n\n");
  switch (choice["Transaction Menu"]) {
    case "1":
      //CHECK BALANCE//
      checkBalance(1);
      break;
    case "2":
      //PRINT ACCOUNT LEDGER//
      printLedger();
      break;
    case "3":
      //CHANGE PIN NUMBER//
      prompt.get(promptSchemasNew.newPin, newPinCallback.bind(this));
      clearTimeout(promptTimeOut);
      break;
    case "4":
      //WITHDRAW FUNDS//
      clearTimeout(promptTimeOut);
      console.log(promptSchemasNew["withdrawFunds"]["properties"]["withdraw funds"]["menu"]);
      prompt.get(promptSchemasNew.withdrawFunds, withdrawFundsCallback.bind(this));
      clearTimeout(promptTimeOut);
      // promptAnotherTransaction()
      break;
    case "5":
      //DEPOSIT FUNDS//
      clearTimeout(promptTimeOut);
      console.log(promptSchemasNew["depositFunds"]["properties"]["deposit funds"]["menu"]);
      prompt.get(promptSchemasNew.depositFunds, depositFundsCallback.bind(this));
      clearTimeout(promptTimeOut);
      break;
    case "6":
      //TRANSFER FUNDS//
      clearTimeout(promptTimeOut);
      console.log(promptSchemasNew["transferFunds"]["properties"]["destinationAccount"]["menu"]);

      // prompt.get(promptSchemasNew.transferFunds, async function (err, result) {
      //   if (err) { return onErr(err); }
      //   console.log('result.destinationAccount '+result.destinationAccount);
      //   // let data = await promptSchemasNew.transferFunds.properties.destinationAccount.validate({account_no:result.destinationAccount})

      //   // if(data.status == false){
      //   //   console.log(' Invalid account no: ' + result.destinationAccount);
      //   //   promptAnotherTransaction()
      //   // }
      // });


      prompt.get(promptSchemasNew.transferFunds, transferFundsCallback.bind(this));
      break;
    case "7":
      //EXIT//
      console.log('Goodbye, ' + fullname + '!');
      process.exit(1);
  }
};


function clearScreen() {
  process.stdout.write('\u001B[2J\u001B[0;0f');
};

function onErr(err) {
  console.log(err);
  return 1;
}

