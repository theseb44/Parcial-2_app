import 'package:flutter/material.dart';
import 'Widgets/product_form.dart';
import 'Widgets/product_mod.dart';
import 'Widgets/product_list.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatefulWidget {
  
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;



  final List<Widget> _pages = const [
    ProductForm(), // Importa y usa la clase Form
    ProductList(), // Importa y usa la clase Lista
    ProductMod(), // Importa y usa la clase Modificacion
  ];

  @override
  Widget build(BuildContext context) {
    //menu "footer" que permite moverse entre paginas
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text("Parcial-2"),
        ), // barra superior en la app
        body: Container(
          child: _pages[_currentIndex],
        ),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'list products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'Update/Delete products',
            ),
          ],
        ),
      ), // scaffold es un componente de interfaz de usuario que proporciona una estructura básica
    );
  }
}
