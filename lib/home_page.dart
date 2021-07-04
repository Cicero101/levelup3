import 'package:flutter/material.dart';
import 'package:levelup3/create_account.dart';
import 'package:levelup3/recover_password.dart';
import 'package:levelup3/sucess.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState(); 
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();
  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      Navigator.push(context,MaterialPageRoute(builder: (context) => Sucesso()))
        .then((value) {
           notes.add(value);
            setState(() {});
        });
    }
  }
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });}

  final notes = <Map<String, dynamic>>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? "Campo obrigatório" : 
                  !value.contains("@") ? "Insira um e-mail válido" : null,
                  onChanged: (value) {},
                  decoration: InputDecoration(labelText: "e-mail"),
                ),
                TextFormField(
                  validator: (value) =>
                  value!.isEmpty ? "Campo obrigatório" : null,
                  onChanged: (value) {},
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: _obscureText,
                ),
                Row(
                    children: [
                      Container(
                        child: ElevatedButton(
                            onPressed: () {
                              _toggle();
                            },
                            child: Text(_obscureText ? "Mostrar Senha" : "Ocultar")),
                      ),
                    ],
                  ),
                SizedBox(
                    height: 48,
                ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              validate();
                              
                                },
                                child: Text("Entrar"))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAccount()))
                                      .then((value) {
                                    notes.add(value);
                                    setState(() {});
                                  });
                                },
                                child: Text("Criar Conta"))),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context) => RecoverPassword()))
                                    .then((value) {
                                    notes.add(value);
                                    setState(() {});
                                    });
                            },
                                child: Text("Recuperar Senha"))),
                      ],
                    )
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
