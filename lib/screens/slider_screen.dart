import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _valorInicial = 0; 
  bool _valorCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImatge()),
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: "Grandaria Imatge",
      value: _valorInicial,
      min: 0,
      max: 350,
      onChanged: (_valorCheckBox) ? null : (estat) {
        setState(() {
          _valorInicial = estat;
        });
      }
    );
  }

  Widget _crearImatge() {
    return Image(
      image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhddvzkL8QugCtRugGj6Gs3tETMcxuHqN15q0QL3KvuckNILeDCBBxDtA&s=10"),
      width: _valorInicial,
      fit: BoxFit.contain,
    );
  }

  // Widget _crearCheckBox() {
  //   return Checkbox(
  //     value: _valorCheckBox,
  //     onChanged: (value) {
  //       setState(() {
  //         _valorCheckBox = value!;
  //       });
  //     }
  //   );
  // }

  Widget _crearCheckBox() {
   return CheckboxListTile(
     title: Text('Bloquejar Slider'),
     value: _valorCheckBox,
     onChanged: (estat){
       setState(() {
         _valorCheckBox = estat!;
       });
     }
   );
 }

 Widget _crearSwitch() {
   return SwitchListTile(
     title: Text('Bloquejar Slider'),
     value: _valorCheckBox,
     onChanged: (estat){
       setState(() {
         _valorCheckBox = estat;
       });
     }
   );
 }


}
