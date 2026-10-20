import 'package:flutter/material.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String _nom = '';
  String _email = '';
  String _data = '';
  String _paisSeleccionat = 'Andorra';

  final List<String> _paisos = ['Andorra', 'Espanya', 'França', 'Itàlia'];
  final TextEditingController _inputDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inputs i Formularis')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _crearInputNom(),
          const Divider(),
          _crearInputEmail(),
          const Divider(),
          _crearInputData(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          ListTile(
            title: Text('Nom: $_nom'),
            subtitle: Text('Email: $_email \vert{} Data:$_data'),
            trailing: Text(_paisSeleccionat),
          ),
        ],
      ),
    );
  }

  Widget _crearInputNom() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: 'Nom complet',
        hintText: 'Ex. Anna Garcia',
        suffixIcon: const Icon(Icons.accessibility),
      ),
      onChanged: (val) => setState(() => _nom = val),
    );
  }

  Widget _crearInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: 'Correu Electrònic',
        suffixIcon: const Icon(Icons.alternate_email),
      ),
      onChanged: (val) => setState(() => _email = val),
    );
  }

  Widget _crearInputData(BuildContext context) {
    return TextField(
      controller: _inputDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        labelText: 'Data de Naixement',
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _seleccionaData(context);
      },
    );
  }

  void _seleccionaData(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _data = picked.toString().split(' ')[0];
        _inputDateController.text = _data;
      });
    }
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        const Icon(Icons.language_rounded),
        const SizedBox(width: 15),
        Expanded(
          child: DropdownButton<String>(
            value: _paisSeleccionat,
            items: _paisos.map((pais) {
              return DropdownMenuItem(value: pais, child: Text(pais));
            }).toList(),
            onChanged: (opt) => setState(() => _paisSeleccionat = opt!),
          ),
        ),
      ],
    );
  }
}