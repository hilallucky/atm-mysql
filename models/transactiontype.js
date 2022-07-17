'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class TransactionType extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  TransactionType.init({
    trans_code: DataTypes.STRING,
    trans_prefix: DataTypes.STRING,
    trans_effect: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'TransactionType',
  });
  return TransactionType;
};