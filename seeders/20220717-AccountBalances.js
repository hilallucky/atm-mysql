'use strict';
const data = require('./data/AccountBalances.json')
const json = data.data.map((el) => {
  el.trans_date = new Date();
  el.createdAt = new Date();
  el.updatedAt = new Date();
  return el
})

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('AccountBalances', json, {})

  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('AccountBalances', null, {})
  }
};
