const account = require('../models').Account
const accountBalance = require('./balance')

const CheckData = () => {

    const checkUserLogin = async(params) => {
        let userLogin
        if(params.account_no === undefined){
            userLogin = await account.findOne({
                where : {
                    username : params.username,
                    password : params.password,
                }
            })
        }else{
            userLogin = await account.findOne({
                where : {
                    account_no : params.account_no
                }
            })
        }
        if(userLogin){
            let balanceAccount = await accountBalance().checkBalanceAccount({accountno : userLogin.account_no})
            let balanceAmount, balance = []
            if(balanceAccount === false){  
                balance.push({account: userLogin.account_no, amountbalance: 0, amount_ow: 0, amount_success: 0})
                balanceAmount = Object.assign({userLogin,balance : balance[0]})
            }else{
                balance.push({account: userLogin.account_no, amountbalance: balanceAccount.amountbalance, amount_receivable : balanceAccount.amount_receivable, 
                            amount_ow: balanceAccount.amount_ow, amount_success: balanceAccount.amount_success})
                balanceAmount = Object.assign({userLogin,balance : balance[0]})
            }
            return balanceAmount
        }else{
            return false
        }
    }

    const insertAccount = async(params) => {
        console.log('param insertAccount = '+JSON.stringify(params))
        let d = Date.now();
        let ms = parseInt(d.valueOf());
        let insertNewAccount = await account.create({ firstname: params.firstname,
                                                        middlename: params.middlename,
                                                        lastname: params.lastname,
                                                        id_no: params.id_no,
                                                        account_no: ms,
                                                        username: params.username,
                                                        password: params.password });
          let result = []
          if(insertNewAccount){
            if(params.amountbalance < 0){
                amount_success = 0
                amount_ow = params.amount_ow
            }else{
                amount_success = params.amount_success
                amount_ow = 0
            }
            let balanceAccount = await accountBalance().insertBalance({account: ms,
                                                                        trans_code: 0,
                                                                        amountbalance : params.newAccount, 
                                                                        amount_ow : 0, 
                                                                        amount_success : amount_success})
            result.push({status:true, balanceAccount, insertNewAccount})
          }else{
            result.push({status:false, balanceAccount, insertNewAccount})
          }
        //   console.log('result '+result)
          return result
    }

    const updatePassword = async(params) => {
        let updPassword = await account.update({ password: params.password }, {
            where: {
                account_no: params.account_no
            }
          });
          let result
          if(updPassword){
            result =  true
          }else{
            result =  false
          }
          return result
    }

    const runCHeck = async(params) => {
        let chekLogin = await checkUserLogin(params)
        if(chekLogin){
            return chekLogin
        }else{
            return false
        }
        
    }

    return {
        runCHeck, updatePassword, insertAccount
    }

}

function runningChek () {
    
    function test() {
        return 'echo'
    }

    return {
        test : test,
        username : "test",
        password : function(data){
            return this.username + " " +data + " " + this.test()
        }
    }
}

// console.log(runningChek().password('sdflkj'));

module.exports = CheckData