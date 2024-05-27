var express = require("express");

const pool = require("../db");
const cookieParser = require("cookie-parser");
const venta = express.Router();

venta.post("/", async(req, res) => {
    try {
        const date = new Date();
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        const hours = String(date.getHours()).padStart(2, '0');
        const minutes = String(date.getMinutes()).padStart(2, '0');
        const seconds = String(date.getSeconds()).padStart(2, '0');

        const mysqlDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
        const values = [
            mysqlDate,
            req.body.monto,
        ];
        const resultVenta = await pool.query(`insert into venta(fecha, monto) values(?,?)`, values);


        var listadetalle = req.body.detalle;
        for (let index = 0; index < listadetalle.length; index++) {
            const valuesDetalle = [
                listadetalle[index]['id'],
                Number(resultVenta.insertId),
                1
            ];
            const valuesDetalle2 = [
                listadetalle[index]['id'],
            ];
            await pool.query(`insert into detalle(id_producto,id_venta,cantidad) values(?,?,?)`, valuesDetalle);
            await pool.query(`update producto set existencia  = existencia-1 where id=?`, valuesDetalle2);

        }
        res.status(200).json({ msg: 'Venta registrada' });
    } catch (error) {
        console.log(error)
        res.status(500).json({ msg: "Error" });
    }
});


venta.get("/", async(req, res) => {
    try {
        const result = await pool.query(`select * from venta`);
        res.json({ msg: result });
    } catch (error) {
        res.status(500).json({ msg: "Error" });
    }
});

module.exports = venta;