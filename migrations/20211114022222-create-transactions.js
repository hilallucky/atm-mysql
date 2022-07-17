'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('Transactions', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      trans_date: {
        type: Sequelize.STRING
      },
      trans_code: {
        type: Sequelize.STRING
      },
      account_source: {
        type: Sequelize.DECIMAL(20,0),
      },
      account_destination: {
        type: Sequelize.DECIMAL(20,0),
      },
      amount: {
        type: Sequelize.INTEGER
      },
      amount_owe: {
        type: Sequelize.INTEGER
      },
      amount_success: {
        type: Sequelize.INTEGER
      },
      amount_balance_start: {
        type: Sequelize.INTEGER
      },
      amount_balance: {
        type: Sequelize.INTEGER
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('Transactions');
  }
};