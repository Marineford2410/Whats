import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final bd = Firestore.instance;

main() => runApp(Nube());

class Nube extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Estado();
  }
}

class Estado extends State {

  final txtMensaje = TextEditingController();

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("CLOUD"),
        ),
        body: TextField(
          decoration: InputDecoration(
            labelText: 'Escribe un mensaje',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16)
            )
          ),
          controller: txtMensaje,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: (){
            insertar(txtMensaje.text);
          },
        ),
      ),
    );
  }

}

void insertar (String mensaje) async {
  await bd.collection("whatsapp").add({'mensaje' : mensaje});
}
