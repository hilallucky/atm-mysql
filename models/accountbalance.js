'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class AccountBalance extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  AccountBalance.init({
    trans_date: DataTypes.STRING,
    account: DataTypes.DECIMAL(20,0),
    trans_code: DataTypes.INTEGER,
    amountbalance: DataTypes.INTEGER,
    amount_receivable: DataTypes.INTEGER,
    amount_ow: DataTypes.INTEGER,
    amount_success: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'AccountBalance',
  });
  return AccountBalance;
};