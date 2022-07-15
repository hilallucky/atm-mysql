require('dotenv').config()
const env = process.env;
const config = {
    PORT : env.PORT || 3001,
    NODE_ENV : env.NODE_ENV || 'development',
    DB_HOST: env.DB_HOST || 'localhost',
    DB_DATABASE : env.DB_DATABASE || 'transactions',
    DB_USERNAME: env.DB_USERNAME || 'root',
    DB_PASSWORD: env.DB_PASSWORD || '',
    DB_CONNECTION : env.DB_CONNECTION || 'mysql'
}

module.exports = config