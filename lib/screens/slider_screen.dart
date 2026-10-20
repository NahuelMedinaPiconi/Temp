import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _valorSlider = 100.0;
  bool _bloquejarCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sliders i Checks')),
      body: Column(
        children: [
          _crearSlider(),
          SwitchListTile(
            title: const Text('Bloquejar Slider'),
            value: _bloquejarCheck,
            onChanged: (val) => setState(() => _bloquejarCheck = val),
          ),
          Expanded(child: _crearImatge()),
        ],
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.deepPurple,
      value: _valorSlider,
      min: 10.0,
      max: 300.0,
      onChanged: _bloquejarCheck
          ? null
          : (val) => setState(() => _valorSlider = val),
    );
  }

  Widget _crearImatge() {
    return Image(
      image: const NetworkImage('https://picsum.photos/id/237/400/400'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}