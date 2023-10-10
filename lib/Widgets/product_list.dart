import 'package:flutter/material.dart';
import 'package:parcial2/DB/db_sql.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> products = [];

  @override
  void initState() {
    super.initState();
    _cargarProductos();
  }

  Future<void> _cargarProductos() async {
    final listaDeProductos = await obtenerDatos();
    setState(() {
      products.addAll(listaDeProductos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        final product = products[index];
        final id = product['id'];
        final codigo = product['codigo'];
        final nombre = product['nombre'];
        final precioVenta = product['precioVenta'];
        final descuento = product['descuento'];

        return Column(
          children: [
            ListTile(
              title: Text('ID: $id'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Codigo: $codigo'),
                  Text('Nombre: $nombre'),
                  Text('Precio de Venta: \$${precioVenta.toStringAsFixed(2)}'),
                  Text('Descuento: ${descuento.toStringAsFixed(2)}%'),
                ],
              ),
              // Personaliza la apariencia de cada elemento de la lista aquí
            ),
            const Divider(
              color: Colors.grey, // Color gris para la separación
              thickness: 1.0, // Grosor de la línea divisora
              height: 1.0, // Altura de la línea divisora
            ),
          ],
        );
      },
    );
  }
}

Future<List<Map<String, dynamic>>> obtenerDatos() async {
  DatabaseHelper dbHelper = DatabaseHelper();
  return await dbHelper.getAllProducts();
}
