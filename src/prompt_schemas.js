const express = require('express')
const {request, response} = express()
const middlewaresCHek = require('../helper/account')

var promptSchemas, colors;
colors = require('colors');

promptSchemas = {

  defaultSchema: {
    properties: {
      "default screen": {
        description: "welcome to the ATM!\nChoose 1 (Transaction), 2 (Register new account).".green,
        pattern: /^[12]$/,
        message: "Please choose 1 for transaction or 2 for new account",
        required: true
      }
    }
  },

  loginSchema: {
    properties : {
        "username" :{
            description: 'User Name',
            pattern:  /^[a-zA-Z\s\-]+$/,
            message: 'Username must be only letters, spaces, or dashes',
            required: true,
        },
        "password" : {
            description: 'Password',
            message: 'Password must be filled',
            // hidden: false,
            required: true,
            validate : async function (params) {
              let result = await middlewaresCHek().runCHeck(params)
              // console.log(result);
              return result
            }
        },
    },
  },

  userRegistration: {
    properties: {
      "newAccount": {
        description: "Lets create new account [press enter]".green
      },
      "firstname": {
        description: "First Name:".green,
        pattern:  /^[a-zA-Z\s\-]+$/,
        message: "Fill your first name".red,
        required: true
      },
      "middlename": {
        description: "Middle Name:".green,
        pattern:  /^[a-zA-Z\s\-]+$/,
        message: "Fill your middle name".red,
        required: true
      },
      "lastname": {
        description: "Last Name:".green,
        pattern:  /^[a-zA-Z\s\-]+$/,
        message: "Fill your last name".red,
        required: true
      },
      "id_no": {
        description: "ID No:".green,
        pattern: /^[0-9]+$/,
        message: "Number only".red,
        required: true
      },
      "deposit": {
        description: "initial deposit: format: 00.00:".green,
        // pattern: /^[0-9]+\.[0-9][0-9]$/,
        pattern: /^[0-9]+$/,
        message: "format two decimals: 1500.00".red,
        required: true
      },
      "username": {
        description: "Create Username:".green,
        pattern:  /^[a-zA-Z\s\-]+$/,
        message: "username for login".red,
        required: true
      },
      "password": {
        description: "secure password: ".green,
        pattern:  /^[0-9]+$/, // /^[0-9][0-9][0-9][0-9]$/,
        message: "must be a secure password (numeric only)".red,
        required: true,
        hidden: false
      },
      "verifypassword": {
        description: "Verify Password:".green,
        pattern:  /^[0-9]+$/, // /^[0-9][0-9][0-9][0-9]$/,
        message: "must be a secure password (numeric only)".red,
        required: true,
        hidden: false,
        validate : async function (params) {
          // console.log('halosussj');
          let result = await middlewaresCHek().insertAccount(params)
          // console.log(JSON.stringify(result)s);
          return result
        }
      }
    }
  },

  anotherTransaction: {
    properties: {
      "another transaction?": {
        description: "Another transaction (y/n)?".green,
        pattern: /y(es)?|n[o]?/i,
        message: "must answer yes or no..".red,
        required: true
      }
    }
  },

  transactionMenu: {
    properties: {
      "Transaction Menu": {
        menu: "Transaction Menu:\n".blue +
              "1 to balance inquery\n".blue +
              "2 to print account ledger\n".blue +
              "3 to change pin number\n".blue +
              "4 to withdraw funds\n".blue +
              "5 to deposit funds\n".blue +
              "6 to transfer funds\n".blue +
              "7 to exit\n".blue,
        description: "Choose between 1-7 :".green,
        pattern: /^[1-7]$/,
        required: true
      }
    }
  },

  newPin: {
    properties: {
      "new pin": {
        description: "new pin".green,
        pattern:  /^[0-9]+$/, // /^[0-9][0-9][0-9][0-9]$/,
        message: "must be a secure password..".red,
        required: true,
        hidden: false
      }
    }
  },

  withdrawFunds: {
    properties: {
      "withdraw funds": {
        menu: "how much would you like to withdraw?\n".blue,
        description: "withdraw:".green,
        pattern: /^[0-9]+$/, // /^[0-9]*[02468]0(\.00)?$/,
        message: "must be number".red,
        required: true
      }
    }
  },

  depositFunds: {
    properties: {
      "deposit funds": {
        menu: "how much would you like to deposit today?\n".blue,
        description: "deposit funds: format 00:".green,
        pattern: /^[0-9]+$/,
        message: "Number only".red,
        required: true
      }
    }
  },

  transferFunds: {
    properties: {
      "destinationAccount": {
        menu: "Please fill destination account and amount\n".blue,
        description: "Destination Account:".green,
        pattern:   /^[0-9]+$/, // /^[0-9][0-9][0-9][0-9]$/,
        message: "account must be number format".red,
        required: true,
        validate : async function (params) {
          console.log('halosussj params = '+JSON.stringify(params));
          let result = await middlewaresCHek().runCHeck(params)
          // console.log(result);
          return result
        }
      },
      "transfer amount": {
        description: "Amount to Transfer: ".green,
        pattern:  /^[0-9]+$/, // /^[0-9][0-9][0-9][0-9]$/,
        message: "account must be number format".red,
        required: true,
        hidden: false,
        validate : async function (params) {
          // console.log('halosussj');
          let result = await middlewaresCHek().insertAccount(params)
          // console.log(result);
          return result
        }
      },
    }
  }
};

module.exports = promptSchemas;