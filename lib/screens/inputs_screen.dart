import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  String _nom = "";
  String _email = "";
  String _data = "";
  String _pais = "Andorra";
  TextEditingController _inputController = TextEditingController();
  List<String> _paisos = ['Andorra','Anglaterra','Dinamarca','Espanya','França'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearContra(),
          Divider(),
          _crearData(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  TextField _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (valor) {
        setState(() {
          _nom = valor;
        });
        // print(_nom);
      },
      decoration: InputDecoration(
        counter: Text("${_nom.length}"),
        hintText: "Escribe Nahuel!",
        labelText: "Nom",
        helperText: "Nom nahuel",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  TextField _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => setState(() => _email = value),
      decoration: InputDecoration(
        hintText: "Correu electronic: ",
        labelText: "Correu",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  TextField _crearContra() {
    return TextField(
      obscureText: true,
      // onChanged: (value) => setState(() => _email = value),
      decoration: InputDecoration(
        hintText: "Contrasenya",
        labelText: "Contrasenya",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  TextField _crearData(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputController,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaData(context);
      },
      decoration: InputDecoration(
        hintText: "Data naixement",
        labelText: "Data naixement",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    );
  }

  void _seleccionaData(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context,
      // locale: Locale("es", "ES"),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _data = picked.toString();
        _inputController.text = _data;
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: [
        Icon(Icons.language),
        SizedBox(width: 30),
        Expanded(
          child: DropdownButton(
            hint: Text(_pais),
            items: getOpcions(),
            onChanged: (opcio) {
              setState(() {
                _pais = opcio as String;
              });
            }),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcions() {
    List<DropdownMenuItem<String>> llista = [];
    _paisos.forEach((pais) {
      llista.add(DropdownMenuItem(
        child: Text(pais),
        value: (pais)
        ));
    });
    return llista;
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nom, $_nom"),
      subtitle: Text("Correu: $_email"),
      trailing: Text(_pais),
    );
  }
}