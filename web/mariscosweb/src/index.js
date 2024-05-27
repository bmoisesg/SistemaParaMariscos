import React from "react";
import ReactDOM from "react-dom/client";


import { Product } from "./product";
import { ProductListado } from "./productoListado";
import { Ventahisotrial } from "./ventaHistorial";

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(
  <div>
    <h1> Mariscos </h1>
    <Product> </Product>
    <br/>
    <br/>
    <br/>
    <ProductListado> </ProductListado>
    <br/>
    <br/>
    <Ventahisotrial> </Ventahisotrial>

  </div>
);
