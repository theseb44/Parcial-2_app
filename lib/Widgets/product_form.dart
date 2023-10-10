import 'package:flutter/material.dart';
import 'package:parcial2/product_class.dart';
import 'package:parcial2/util/text_num_input.dart';
import 'package:parcial2/util/success_dialog.dart';
import 'package:parcial2/DB/db_sql.dart';

class ProductForm extends StatefulWidget {

  const ProductForm({ Key? key}) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _descuentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(bottom: 90.0),
                  child: const Text(
                    'Agregar Producto',
                    style: TextStyle(
                      fontSize:
                          37, 
                      fontWeight: FontWeight
                          .bold, 
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                inputAbstracto(
                    controller: _codigoController,
                    labelText: 'CÓDIGO DEL PRODUCTO'),
                const SizedBox(height: 10),
                inputAbstracto(
                    controller: _nombreController,
                    labelText: 'NOMBRE DEL PRODUCTO'),
                const SizedBox(height: 10),
                inputAbstracto(
                    controller: _precioController,
                    labelText: 'PRECIO DE VENTA',
                    op: false),
                const SizedBox(height: 10),
                inputAbstracto(
                    controller: _descuentoController,
                    labelText: 'DESCUENTO',
                    op: false),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async{
                    if (_formKey.currentState!.validate()) {
                      final producto = Product(
                        id: 0,
                        codigo: _codigoController.text,
                        nombre: _nombreController.text,
                        precioVenta: double.parse(_precioController.text),
                        descuento: double.parse(_descuentoController.text),
                      );

                      
                      DatabaseHelper dbHelper = DatabaseHelper();

                      await dbHelper.insertProduct(producto);

                      success(context, 'Successful save');
                      // Limpiar los campos del formulario
                      _codigoController.clear();
                      _nombreController.clear();
                      _precioController.clear();
                      _descuentoController.clear();
                    }
                  },
                  child: const Text('Save product'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

