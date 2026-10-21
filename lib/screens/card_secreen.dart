import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardTipus1(),
          SizedBox(height: 10),
          _cardTipus2(),
          SizedBox(height: 10),
          _cardTipus1(),
          SizedBox(height: 10),
          _cardTipus2(),
          SizedBox(height: 10),
          _cardTipus1(),
          SizedBox(height: 10),
          _cardTipus2(),
          SizedBox(height: 10),
          _cardTipus1(),
          SizedBox(height: 10),
          _cardTipus2(),
          SizedBox(height: 10),
          _cardTipus1(),
          SizedBox(height: 10),
          _cardTipus2(),
          SizedBox(height: 10),
        ],
      ),
    );
    }

  Widget _cardTipus1() {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Nahuel"),
            subtitle: Text("Un home molt bó programant"),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){}, child: Text("Vale")),
              TextButton(onPressed: (){}, child: Text("NO"))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipus2() {
    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image:
            NetworkImage("https://thumb.wikimedia.org/wikipedia/commons/thumb/8/8b/Zoom_by_Jean_Sander.jpg/250px-Zoom_by_Jean_Sander.jpg?utm_source=es.wikipedia.org&utm_campaign=parser&utm_content=thumbnail"),
            fadeInDuration: Duration(milliseconds: 100),
            height: 250,
            fit: BoxFit.cover
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Text("Imagen"))
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow> [
          BoxShadow(
         color: Colors.black26,
         blurRadius: 10.0,
         spreadRadius: 2.0,
         offset: Offset(2.0, 10.0)
       )

        ]
        // color: Colors.red
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card
      ),
    );
  }
}