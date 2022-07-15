
const express = require('express');
const app = express();
const bodyParser = require('body-parser');

/**
 * set .env as development || production
 */
const config = require("./config")

// parsing body json
app.use(bodyParser.urlencoded({extended:true}))
app.use(bodyParser.json())

app.listen(config.PORT, () =>{
    console.log(config.PORT)

    var newReg,
    ATM = require('./src/atm');

    // newReg = new ATM();
    // newReg.on();

})
