import 'package:catinteractiu/providers/menu_providers.dart';
import 'package:catinteractiu/routes/app_routes.dart';
import 'package:catinteractiu/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components")
      ),
      body: _llista()
    );
  }

  Widget _llista() {

    // menuProvider.CarregarDades().then((data) {
    //   print("Llista: ");
    //   print(data);
    // });

    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        print("builder");
        print(snapshot.data);
        return ListView (
          children: _llistaElements(snapshot.data, context)
        );
      },
      future: menuProvider.CarregarDades(),
      initialData: [],
    );
  }

  List<Widget> _llistaElements( List<dynamic>? data, BuildContext context) {
    final List<Widget> elements =[];
    data?.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texte']),
        leading: getIcon(element["icona"]),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: (){
          // final route = MaterialPageRoute(builder: (context) =>  AlertScreen());
          // Navigator.push(context, route);
          Navigator.push(context, element["ruta"]);
        },
      );
    elements..add(widgetTemp)..add(Divider());
    });
    return  elements;
  }

}