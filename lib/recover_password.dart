import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  final String? email;
  RecoverPassword({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final formKey = GlobalKey<FormState>();
  var email;

  void validate() {
    final form = formKey.currentState;
    if (form!.validate()) {
      final map = Map<String, dynamic>();
      map.addAll({"e-mail": email});
      Navigator.pop(context, map);
    }
  }

  @override
  void initState() {
    email = widget.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recuperar Senha"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 48,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                            child: Text("Insira o e-mail para receber a nova senha:",
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            )
                        )
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: widget.email,
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) =>
                      value!.isEmpty ? "Campo obrigatorio" : null,
                  decoration: InputDecoration(labelText: "e-mail"),
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
                            child: Text("Confirmar"))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
