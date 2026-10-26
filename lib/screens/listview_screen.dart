import 'dart:async';

import 'package:flutter/material.dart';

class LlistaScreen extends StatefulWidget {
  const LlistaScreen({super.key});

  @override
  State<LlistaScreen> createState() => _LlistaScreenState();
}

class _LlistaScreenState extends State<LlistaScreen> {

  List<int> _llistaNombres = [];
  int _darrerItem = 0;
  ScrollController _scrollController = new ScrollController();
  bool _estaCarregant = false;

  @override
  void initState() {
    super.initState();
    _crearNou();
    _scrollController.addListener(() {
     if (_scrollController.position.atEdge) {
      fetchData();
     }
   });

  }

   @override
 void dispose() {
   // TODO: implement dispose
   super.dispose();
   _scrollController.dispose();
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina de llista"),
      ),
      body: Stack(
       children: [
         _crearLlista(),
         _crearLoading()
       ]
     ),

    );
  }

  Widget _crearLlista() {
    return RefreshIndicator(
      onRefresh: obtenirPagina(),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _llistaNombres.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _llistaNombres[index];
          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/id/${image}/200/300")
          );
        }
      ));
  }

  void _crearNou() {
    for (int i = 0; i < 5; i++) {
      _llistaNombres.add(_darrerItem);
      _darrerItem++;
    }
    setState(() {
      
    });
  }

  Future<Timer> fetchData() async{
   _estaCarregant = true;
   setState(() { });
   final duration = new Duration(seconds: 2);
   return Timer(duration, peticioHTTP);
 }

 Widget _crearLoading() {
  if(_estaCarregant){
     return Column(
       mainAxisAlignment: MainAxisAlignment.end,
       mainAxisSize: MainAxisSize.max,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             CircularProgressIndicator()
           ],
         ),
         SizedBox(height: 15.0)
       ],
     );
   }else{
     return Container();
   }

 }

  void peticioHTTP(){
   _estaCarregant = false;
   _crearNou();
   _scrollController.animateTo(
     _scrollController.position.pixels + 100,
     duration: Duration(milliseconds: 250),
     curve: Curves.fastOutSlowIn
   );
 }

 Future<Null> obtenirPagina() async{
   final duration = new Duration(seconds: 2);
   new Timer(duration, (){
     // Purgam la llista de nombres
     _llistaNombres.clear();
     _darrerItem++;
     _crearNou();
   });
   return Future.delayed(duration);
 }


 }