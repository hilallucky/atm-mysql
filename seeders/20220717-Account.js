'use strict';
const data = require('./data/Accounts.json')
const json = data.data.map((el) => {
  el.createdAt = new Date();
  el.updatedAt = new Date();
  return el
})

module.exports = {
  up: async (queryInterface, Sequelize) => {
    return queryInterface.bulkInsert('Accounts', json, {})

  },

  down: async (queryInterface, Sequelize) => {
    return queryInterface.bulkDelete('Accounts', null, {})
  }
};
