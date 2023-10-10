export 'product_class.dart';

class Product {
  int id;
  String codigo;
  String nombre;
  double precioVenta;
  double descuento;

  Product({
    required this.id,
    required this.codigo,
    required this.nombre,
    required this.precioVenta,
    required this.descuento,
  });

  // Método para convertir un objeto Product a un mapa
  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'nombre': nombre,
      'precioVenta': precioVenta,
      'descuento': descuento,
    };
  }

  // Método para crear un objeto Product a partir de un mapa
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      codigo: map['codigo'],
      nombre: map['nombre'],
      precioVenta: map['precioVenta'],
      descuento: map['descuento'],
    );
  }
}
