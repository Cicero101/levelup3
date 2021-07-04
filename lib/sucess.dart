import 'package:flutter/material.dart';

class Sucesso extends StatefulWidget {
  Sucesso({
    Key? key,
  }) : super(key: key);

  @override
  _SucessoState createState() => _SucessoState();
}

class _SucessoState extends State<Sucesso> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sucesso"),
      ),
      body: Column(
   
      ),
    );
  }
}
