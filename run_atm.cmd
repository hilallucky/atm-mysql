@echo off
npm install -g
npx sequelize db:create
npx sequelize db:migrate
npx sequelize-cli db:seed:all
npm run start
START