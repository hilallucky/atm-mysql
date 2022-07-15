'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Transactions extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Transactions.init({
    trans_date: DataTypes.STRING,
    trans_code: DataTypes.INTEGER,
    account_source: DataTypes.DECIMAL(20,0),
    account_destination: DataTypes.DECIMAL(20,0),
    amount: DataTypes.INTEGER,
    amount_owe: DataTypes.INTEGER,
    amount_success: DataTypes.INTEGER,
    amount_balance_start: DataTypes.INTEGER,
    amount_balance: DataTypes.INTEGER
  }, {
    sequelize,
    modelName: 'Transactions',
  });
  return Transactions;
};