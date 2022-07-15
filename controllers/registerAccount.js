// const m_regAccount = require('../models/customers');

// // cons createAccount = async(req, res) => {
// //     let transactions;
// //     try{
// //         transactions = await regAccount.create()
// //     }
// // }

// class Controller_regAccount{
//     static async getAccount(req) {
//         try {
//             let res = m_regAccount.create({
//                 firstname: 'firstname',
//                 middlename: 'middlename',
//                 lastname: 'lastname',
//                 id_no: '123123',
//                 account_no: '123321',
//                 username: 'satu',
//                 password: 'satu',
//             })

//             return res;
//         } catch (error) {
//             console.log(error);
//             return error;
//         }
//     }
// }



var regAccount, colors, 
    patternNumberOnly = /^[0-9]+\.[0-9][0-9]$/,
    patternWordOnly = /^[a-zA-Z\s\-]+$/;
colors = require('colors');

regAccount = {
    defaultSchema: {
        properties: {
          "default screen": {
            description: "Welcome to the ATM!\nChoose 1 for transaction or 2 to open a new account..".green,
            pattern: /^[12]$/,
            message: "Please choose 1 for transaction or 2 for new account",
            required: true
          }
        }
      },

      userRegistration: {
        properties: {
            "initial deposit": {
                description: "initial deposit: format: 00.00:".green,
                pattern: /^[0-9]+\.[0-9][0-9]$/,
                message: "format two decimals: 1500.00".red,
                required: true
              },
            "First Name ": {
                description: "Fill your first name : ".green,
                pattern: patternWordOnly,
                message: "Words only".red,
                required: true
              },

            "Middle Name ": {
                description: "Fill your middle name :".green,
                pattern: patternWordOnly,
                message: "Words only".red,
                required: true
            },

            "Last Name ": {
            description: "Fill your last name :".green,
            pattern: patternWordOnly,
            message: "Words only".red,
            required: true
            },

            "ID Number ": {
            description: "Fill your ID number : ".green,
            pattern: patternNumberOnly,
            message: "Numbers only".red,
            required: true
            },

            "Account Number ": {
            description: "Remember, this is your account number".green,
            pattern: patternNumberOnly,
            message: "Your Account number : ".red,
            required: true
            },

            "First Name ": {
            description: "initial deposit: format: 00.00:".green,
            pattern: /^[0-9]+\.[0-9][0-9]$/,
            message: "format two decimals: 1500.00".red,
            required: true
            },
          "initial deposit": {
            description: "initial deposit: format: 00.00:".green,
            pattern: /^[0-9]+\.[0-9][0-9]$/,
            message: "format two decimals: 1500.00".red,
            required: true
          },
          "secure pin": {
            description: "secure pin: 4 digit number:".green,
            pattern: /^[0-9][0-9][0-9][0-9]$/,
            message: "must be a 4 digit number..".red,
            required: true,
            hidden: true
          },
          "verify pin": {
            description: "verify pin:".green,
            pattern: /^[0-9][0-9][0-9][0-9]$/,
            message: "must be a 4 digit number..".red,
            required: true,
            hidden: true
          }
        }
      },

}