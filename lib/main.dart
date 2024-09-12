import 'package:flutter/material.dart';

void main() => runApp(AplicativoCalculadora());

class AplicativoCalculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaCalculadora(),
    );
  }
}

class TelaCalculadora extends StatefulWidget {
  @override
  _EstadoTelaCalculadora createState() => _EstadoTelaCalculadora();
}

class _EstadoTelaCalculadora extends State<TelaCalculadora> {
  String _saida = "0";
  String _numeroAtual = "";
  double _numero1 = 0;
  String _operador = "";

  void _botaoPressionado(String textoBotao) {
    setState(() {
      if (textoBotao == "C") {
        _saida = "0";
        _numeroAtual = "";
        _numero1 = 0;
        _operador = "";
      } else if (textoBotao == "+" || textoBotao == "-" || textoBotao == "*" || textoBotao == "/") {
        _numero1 = double.parse(_saida);
        _operador = textoBotao;
        _numeroAtual = "";
      } else if (textoBotao == "=") {
        double _numero2 = double.parse(_numeroAtual);
        switch (_operador) {
          case "+":
            _saida = (_numero1 + _numero2).toString();
            break;
          case "-":
            _saida = (_numero1 - _numero2).toString();
            break;
          case "*":
            _saida = (_numero1 * _numero2).toString();
            break;
          case "/":
            _saida = (_numero1 / _numero2).toString();
            break;
        }
        _numero1 = 0;
        _operador = "";
        _numeroAtual = "";
      } else {
        _numeroAtual += textoBotao;
        _saida = _numeroAtual;
      }
    });
  }

  Widget _construirBotao(String textoBotao) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          textoBotao,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => _botaoPressionado(textoBotao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculadora Flutter')),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
              child: Text(
                _saida,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(children: [
              Row(children: [
                _construirBotao("7"),
                _construirBotao("8"),
                _construirBotao("9"),
                _construirBotao("/")
              ]),
              Row(children: [
                _construirBotao("4"),
                _construirBotao("5"),
                _construirBotao("6"),
                _construirBotao("*")
              ]),
              Row(children: [
                _construirBotao("1"),
                _construirBotao("2"),
                _construirBotao("3"),
                _construirBotao("-")
              ]),
              Row(children: [
                _construirBotao("."),
                _construirBotao("0"),
                _construirBotao("00"),
                _construirBotao("+")
              ]),
              Row(children: [
                _construirBotao("C"),
                _construirBotao("="),
              ])
            ])
          ],
        ),
      ),
    );
  }
}