require("dotenv").config();

const mariadb = require("mariadb");

const pool = mariadb.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
});

pool.getConnection().then((connection) => {
    console.log("Success conexion to db...");
});

module.exports = pool;