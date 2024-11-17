import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Primera Pantalla - Contador')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Contador: $_counter'),
            SizedBox(height: 20), // Espacio entre el contador y los botones
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Aumentar'),
            ),
            SizedBox(height: 10), // Espacio entre los botones
            ElevatedButton(
              onPressed: _decrementCounter,
              child: Text('Disminuir'),
            ),
            SizedBox(height: 20), // Espacio entre los botones y el siguiente botón
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Ir a la segunda pantalla'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> _items = [];

  void _addItem() {
    setState(() {
      _items.add('Elemento ${_items.length + 1}');
    });
  }

  void _removeItem() {
    if (_items.isNotEmpty) {
      setState(() {
        _items.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Segunda Pantalla - Lista de Elementos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _addItem,
              child: Text('Agregar Elemento'),
            ),
            SizedBox(height: 10), // Espacio entre los botones
            ElevatedButton(
              onPressed: _removeItem,
              child: Text('Eliminar Elemento'),
            ),
            SizedBox(height: 20), // Espacio entre los botones y la lista
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 20), // Espacio entre la lista y el botón de regresar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar a la primera pantalla'),
            ),
          ],
        ),
      ),
    );
  }
}
