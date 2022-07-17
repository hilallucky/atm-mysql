'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('AccountBalances', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      trans_date: {
        type: Sequelize.STRING
      },
      account: {
        type: Sequelize.DECIMAL(20,0),
      },
      trans_code: {
        type: Sequelize.STRING
      },
      amountbalance: {
        type: Sequelize.INTEGER
      },
      amount_receivable: {
        type: Sequelize.INTEGER
      },
      amount_ow: {
        type: Sequelize.INTEGER
      },
      amount_success: {
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
    await queryInterface.dropTable('AccountBalances');
  }
};