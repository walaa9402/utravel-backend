var mysql = require('mysql');

var pool = mysql.createPool({

connectionLimit : 10,
host : 'localhost',
user : 'admin',
password : '',
charset: 'utf8',
database : 'utravel'
});



module.exports = pool;