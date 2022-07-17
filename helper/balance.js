const transactions = require('../models').Transactions
const accountBalance = require('../models').AccountBalance
const account = require('../models').Account

const CheckBalance = () => {

  const checkBalanceAccount = async (params) => {
    let balanceAccount = await accountBalance.findOne({
      where: {
        account: params.accountno
      }
    })
    return !balanceAccount ? false : balanceAccount
  }

  const transactionLedger = async (params) => {
    let transaction = await transactions.findAll({
      where: {
        account_source: params.account_source
      },
      order: [['trans_date', 'DESC']],

    })
    return !transaction ? false : transaction
  }

  const updateBalance = async (params) => {
    amount_ow = params.amount_ow
    amount_success = params.amount_success
    let updBalanceAmount = await accountBalance.update({ amountbalance: params.amountbalance, amount_receivable: params.amount_receivable, amount_ow: amount_ow, amount_success: amount_success }, {
      where: {
        account: params.account
      }
    });
    let result = []
    if (updBalanceAmount) {
      let checkBalanceAccount = await CheckBalance().checkBalanceAccount({ accountno: params.account })

      // console.log(checkBalanceAccount)
      result.push({ status: true, checkBalanceAccount })
    } else {
      result.push({ status: false, insertBalanceAmount })
    }
    //   console.log(result)
    return result
  }

  const insertBalance = async (params) => {
    // console.log(params)
    if (params.amountbalance < 0) {
      amount_success = 0
      amount_ow = params.amount_ow
    } else {
      amount_success = params.amount_success
      amount_ow = 0
    }
    let insertBalanceAmount = await accountBalance.create({
      account: params.account,
      trans_code: params.trans_code,
      amountbalance: params.amountbalance,
      amount_receivable: params.amount_receivable,
      amount_ow: params.amount_ow,
      amount_success: amount_success
    }, {
      where: {
        account: params.account
      }
    });
    let result = []
    if (insertBalanceAmount) {
      result.push({ status: true, insertBalanceAmount })
    } else {
      result.push({ status: false, insertBalanceAmount })
    }
    return result
  }


  const insertTransaction = async (params) => {
    if (params.amountbalance < 0) {
      amount_success = 0
      amount_ow = params.amount_ow
    } else {
      amount_success = params.amount_success
      amount_ow = 0
    }
    let insertTrans = await transactions.bulkCreate(params)
    let result = []
    // console.log(insertTrans)
    if (insertTrans) {
      result.push({ status: true, insertTrans })
    } else {
      result.push({ status: false, insertTrans })
    }
    //   console.log(result)
    return result
  }

  return {
    checkBalanceAccount, transactionLedger, updateBalance, insertBalance, insertTransaction
  }

}
// console.log(CheckBalance().checkBalanceAccount('sss'));

module.exports = CheckBalance