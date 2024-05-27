import React, { useState } from 'react';
import './style.css';

export function ProductListado() {
    const [productos, setProductos] = useState([]);

    const obtenerProductos = () => {
        fetch('http://localhost:8080/producto')
            .then(response => response.json())
            .then(data => {
                setProductos(data['msg']);
            })
            .catch(error => console.error('Error fetching data:', error));
    };

    return (
        <div className='container'>
            <h1 className='heading'>Inventario</h1>

            <button className="button" onClick={obtenerProductos}>
                Obtener todos los productos
            </button>
            <br/>
            <br/>

            <table className="productos-table">
                <thead>
                    <tr>
                        <th>Cantidad </th>
                        <th>Nombre del Producto</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    {productos.map(producto => (
                        <tr key={producto.id}>
                            <td>{producto.existencia}</td>
                            <td>{producto.nombre}</td>
                            <td>Q{producto.valor}</td>
                        </tr>
                    ))}
                </tbody>
            </table>
        </div>
    );
}
