import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  final String? email;
  final String? password;
  final String? emailAux;
  final String? passwordAux;
  final String? name;
  final String? nickname;
  CreateAccount({
    Key? key,
    this.email,
    this.password,
    this.emailAux,
    this.passwordAux,
    this.name,
    this.nickname,
  }) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final formKey = GlobalKey<FormState>();
  var email;
  var password;
  var emailAux;
  var passwordAux;
  var name;
  var nickname;
  bool _obscureText = true;
  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      final map = Map<String, dynamic>();
      Navigator.pop(context, map);
    }
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  void initState() {
    email = widget.email;
    password = widget.password;
    emailAux = widget.emailAux;
    passwordAux = widget.passwordAux;
    name = widget.name;
    nickname = widget.nickname;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: widget.name,
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatório" : null,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(labelText: "Nome"),
                ),
                TextFormField(
                  initialValue: widget.nickname,
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatório" : null,
                  onChanged: (value) {
                    nickname = value;
                  },
                  decoration: InputDecoration(labelText: "Apelido"),
                ),
                TextFormField(
                  initialValue: widget.email,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatório" :
                      !value.contains("@") ? "Insira um e-mail válido" : null,
                  decoration: InputDecoration(labelText: "e-mail"),
                ),
                TextFormField(
                  initialValue: widget.emailAux,
                  onChanged: (value) {
                    emailAux = value;
                  },
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatório" :
                      emailAux != email ? "Os campos de e-mail devem ser iguais" : null,
                  decoration: InputDecoration(labelText: "Confirmar e-mail"),
                ),
                TextFormField(
                  initialValue: widget.password,
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatório" :
                      value.length < 6 ? 'A senha deve ter pelo menos 6 dígitos' : null,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(labelText: "Senha"),
                  obscureText: _obscureText,
                ),
                TextFormField(
                  initialValue: widget.passwordAux,
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatório" :
                      passwordAux != password? "Os campos de senha devem ser iguais" : null,
                  onChanged: (value) {
                    passwordAux = value;
                  },
                  decoration: InputDecoration(labelText: "Confirmar Senha"),
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
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              validate();
                            },
                            child: Text("Confirmar"))),
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
