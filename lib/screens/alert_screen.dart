import 'package:flutter/material.dart';


class AlertScreen extends StatelessWidget {


 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Pàgina Alerta'),
     ),
     body: Center(
      child: ElevatedButton(
        onPressed: ()=> _mostrarAlerta(context),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shape: StadiumBorder()
        ),
        child: Text("Boto alerta")
        ),
     ),
  );
 }

 void _mostrarAlerta(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return AlertDialog(
        title: Text("Hola profe!"),
        content: Column(
          mainAxisSize: MainAxisSize.min,  
          children: [
            Text("Posam un 10"),
            FlutterLogo(size: 50)
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Cancelar")),
          TextButton(onPressed: ()=> Navigator.of(context).pop(), child: Text("Ok")),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
      );
    }
    );
 }
}
