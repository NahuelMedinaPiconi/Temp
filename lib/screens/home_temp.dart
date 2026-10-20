import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final elements = ["Element 1", "Element 2", "Element 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Component Temp")
        ),
        body: ListView(
          children: _crearElementsCurt()
        )
      );
  }

  // List<Widget> _crearElements() {

  //   List<Widget> llista = [];
  //   for (var element in elements) {
  //     llista.add(ListTile(
  //       title: Text(element)
  //     ));
  //     llista.add(Divider());
  //   }
  //   return llista;
  // }

  List<Widget> _crearElementsCurt() {
    var widgets = elements.map((element) {
      return Column(
        children: [
          ListTile(
            title: Text("$element!"),
            subtitle: Text("By Nahuel"),
            leading: Icon(Icons.man),
            trailing: Icon(Icons.attach_file_rounded),
          ),
          Divider()
        ],
      );
    });

    return widgets.toList();
  }
}