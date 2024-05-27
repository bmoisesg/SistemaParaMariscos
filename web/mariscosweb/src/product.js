import './style.css'
import React, { useState } from 'react';

export function Product() {


     const [productName, setProductName] = useState('');
     const [stock, setStock] = useState('');
     const [price, setPrice] = useState('');
     const [details, setDetails] = useState('');

     const handleProductNameChange = (event) => {
         setProductName(event.target.value);
     };

     const handleStockChange = (event) => {
         setStock(event.target.value);
     };

     const handlePriceChange = (event) => {
         setPrice(event.target.value);
     };

     const handleDetailsChange = (event) => {
         setDetails(event.target.value);
     };

    return <div class='container'>
    <h1 class='heading'> Ingresar producto </h1>

    <h3 class="label"> Nombre: </h3> <
    input type = "text"
    name = "field1"
    class= 'input'
    value={productName}
    onChange={handleProductNameChange}/>

    <h3  class="label"> Existencia: </h3>
    <input type = "text"
    name = "field2"
    class= 'input'
    value={stock}
    onChange={handleStockChange}/>

    <h3  class="label"> Valor: </h3>
    <input type = "text"
    name = "field3"
    class= 'input'
    value={price}
    onChange={handlePriceChange} />

    <h3  class="label"> Detalle: </h3> <
    input type = "text"
    name = "field4"
    class= 'input'
    value={details}
    onChange={handleDetailsChange} />

    <br />
    <br />

    <button type = ""  class="button"
      onClick={()=>{

        console.log(productName);
        console.log(stock);
        console.log(price);
        console.log(details);

        /*fetch('http://localhost:8080/producto')
          .then(response => response.json())
           .then(data => console.log(data))
           .catch(error => console.error('Error fetching data:', error)) */


    const productData = {
          nombre: productName,
          existencia: stock,
          valor: price,
          detalle: details
    };

      const requestOptions = {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(productData)
        };

           fetch('http://localhost:8080/producto', requestOptions)
            .then(response => response.json())
            .then(data => alert(data['msg']))
            .catch(error => console.error('Error fetching data:', error))



      }}
    > Agregar producto < /button>

    </div> ;
}
