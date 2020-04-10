import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alcoolGasolina extends StatefulWidget {
  @override
  _alcoolGasolinaState createState() => _alcoolGasolinaState();
}

class _alcoolGasolinaState extends State<alcoolGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _textResultado = " ";

  void _calcular(){

    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    var result = precoAlcool/precoGasolina;

    if(result >= 0.7){
      setState(() {
        _textResultado = "É melhor abastecer Gasolina!";
      });
    }else{
      setState(() {
        _textResultado = "É melhor abastecer Alcool!";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Image.asset("images/logo.png")
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                "Saida qual a melhor opção para abastecimento do seu carro",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço Alcool, ex: 1.59",
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Preço Gasolina, ex: 3.15"
              ),
              style: TextStyle(
                fontSize: 22,
              ),
              controller: _controllerGasolina,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: RaisedButton(
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                color: Colors.blue,
                onPressed: _calcular,
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                _textResultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ]
        ),
        ),
      )
    );
  }
}