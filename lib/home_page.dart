import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:formulario_mobx/controller.dart';

class HomePage extends StatelessWidget {
  var _controller = Controller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cliente"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: ListView(
          children: <Widget>[
            Observer(
              builder: (_) {
                return _textField(
                  "Nome",
                  _controller.client.mudaNome,
                  errorText: _controller.validateNome,
                );
              },
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return _textField(
                  "E-mail",
                  _controller.client.mudaEmail,
                  errorText: _controller.validateEmail,
                );
              },
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return _textField("Cpf", _controller.client.mudaCpf);
              },
            ),
            SizedBox(
              height: 30,
            ),
            Observer(
              builder: (_) {
                return _botao();
              },
            ),
          ],
        ),
      ),
    );
  }

  _botao() {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "Salvar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: _controller.isValid
            ? () {
                print("salvando");
              }
            : null,
      ),
    );
  }

  _textField(String labelText, onChanged, {String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
}
