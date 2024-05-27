## Titutlo 
Marisqueria feliz

## Uso

Aplicacion para gestion de inventario para una marisqueria y venta de productos, apliacion realiada en Flutter, disponible para dispositivos Android.


### Acciones que realiza este servidor: 
- Ingreso de nuevos productos.
- Listado de existencias de productos
- Venta de productos
- Consulta de registro de ventas


## variables de entorno que necesita: 
```
DB_HOST=...
DB_USER=...
DB_PASSWORD=...
DB_DATABASE=...

PORT=...
```

## paquetes utilizados
cookie parser": ^1.4.6,

cors : ^2.8.5,

dotenv : ^16.3.1,

express : ^4.17.1,

morgan : ^1.10.0,

nodemon : ^2.0.2"

## Endpoint

### Get "producto/"
Retornar todos los productos que existten en el sistema, con su detalle

### POST "producto/"
Ingresa un nuevo producto al sistema

### Get "venta/"
Retorna todos las ventas realizadas en el sistema

### POST "venta/"
Ingresa una venta, con todo su detalle de prodcutos, hace descuento de existencias.


## Notas extras
Este servidor por el momento esta en local, se compartiran los datos necesarios para conectarse a la base de datos en la nube.