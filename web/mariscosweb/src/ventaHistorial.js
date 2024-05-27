import React, { useState } from 'react';
import './style.css';

export function Ventahisotrial() {
    const [historial, setHistorial] = useState([]);

    const obtenerProductos = () => {
        fetch('http://localhost:8080/venta')
            .then(response => response.json())
            .then(data => {
              console.log(data['msg']);
              setHistorial(data['msg']);
            })
            .catch(error => console.error('Error fetching data:', error));
    };

    return (
        <div className='container'>
            <h1 className='heading'>Historial Ventas</h1>

            <button className="button" onClick={obtenerProductos}>
                Obtener todos los productos
            </button>
            <br/>
            <br/>
            <table className="productos-table">
                <thead>
                    <tr>
                        <th>Fecha </th>
                        <th>Monto</th>
                    </tr>
                </thead>
                <tbody>
                    {historial.map(elemento => (
                        <tr key={elemento.id}>
                            <td>{elemento.fecha}</td>
                            <td>Q{elemento.monto}</td>
                        </tr>
                    ))}
                </tbody>
            </table>

        </div>
    );
}
