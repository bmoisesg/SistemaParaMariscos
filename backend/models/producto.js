var express = require("express");

const pool = require("../db");
const cookieParser = require("cookie-parser");
const producto = express.Router();

producto.get("/", async(req, res) => {
    try {
        const result = await pool.query(`select * from producto`);
        res.json({ msg: result });
    } catch (error) {
        res.status(500).json({ msg: "Error" });
    }
});

producto.post("/", async(req, res) => {
    try {
        const values = [
            req.body.nombre,
            req.body.existencia,
            req.body.valor,
            req.body.detalle
        ];
        const result = await pool.query(`insert into producto(nombre, existencia, valor, detalle) values(?,?,?,?)`, values);
        res.status(200).json({ msg: 'Insertado con exito' });
    } catch (error) {
        res.status(500).json({ msg: "Error" });
    }
});

module.exports = producto;