'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Account extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  Account.init({
    firstname: DataTypes.STRING,
    middlename: DataTypes.STRING,
    lastname: DataTypes.STRING,
    id_no: {
      type: DataTypes.STRING, 
      allowNull: false, 
      validate: {
        isUniqueIdNo: function(value, next) {

          Account.findOne({
                where: {id_no: value},
                attributes: ['id_no']
            })
                .done(function(error, user) {
                    if (error)
                        return next({message: 'ID No already registered'});
                    next();
                });
        }
    }
    },
    account_no: {
      type: DataTypes.DECIMAL(20, 0), 
      allowNull: false, 
      validate: {
        isUniqueAccountNo: function(value, next) {

          Account.findOne({
                where: {account_no: value},
                attributes: ['account_no']
            })
                .done(function(error, user) {
                    if (error)
                        return next({message: 'Account No already registered'});
                    next();
                });
        }
    }
    },
    username: {
      type: DataTypes.STRING, 
      allowNull: false, 
      validate: {
        isUniqueUsername: function(value, next) {

          Account.findOne({
                where: {username: value},
                attributes: ['username']
            })
                .done(function(error, user) {
                    if (error)
                        return next({message: 'Username already registered'});
                    next();
                });
        }
    }
    },
    password: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Account',
  });
  return Account;
};