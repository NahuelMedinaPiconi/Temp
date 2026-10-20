import 'package:flutter/material.dart';


class AlertScreen extends StatelessWidget {


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Pàgina Alerta'),
     ),
     floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
        }
    )
   );
 }
}
