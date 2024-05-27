var express = require("express");
var morgan = require("morgan");
var cors = require("cors");
var cookieParser = require("cookie-parser");

require("dotenv").config();
var corsOptions = { origin: true, optionsSuccessStatus: 200 };
var app = express();
var port = process.env.PORT;

app.disable("x-powered-by");
app.use(morgan("dev"));
app.use(express.json());
app.use(cookieParser());
app.use(express.urlencoded({ extended: true }));
app.use(cors(corsOptions));

app.listen(port, function() {
    console.log(`app listening on port ${port}!`);
});

app.get("/", async(req, res) => {
    res.json({ msg: "ready server..." });
});

const producto = require("./models/producto");
const venta = require("./models/venta");

app.use("/producto", producto);
app.use("/venta", venta);