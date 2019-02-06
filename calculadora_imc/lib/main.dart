import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(

    home: Home(),

  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String info = "Informe seus dados.";

  void  _resetfields(){

    weightController.text = "";
    heightController.text = "";

    setState(() {
      info = "Informe seus dados.";

    });

  }

  void calculate(){

    setState(() {

      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);

      if(imc < 18.6) {
        info = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      }
      else if(imc >= 18.6 && imc < 24.9){

        info = "Peso ideal (${imc.toStringAsPrecision(3)})";

      }
      else if(imc >= 24.9 && imc < 29.9){

        info = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";

      }
      else if(imc >= 29.9 && imc < 34.9){

        info = "Obesidade grau I (${imc.toStringAsPrecision(3)})";

      }
      else if(imc >= 34.9 && imc < 39.9){

        info = "Obesidade grau II (${imc.toStringAsPrecision(3)})";

      }
      else if(imc > 40.0){

        info = "Obesidade grau III (${imc.toStringAsPrecision(3)})";

      }

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[

          IconButton(icon: Icon(Icons.refresh), onPressed: _resetfields,)

        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child:
        Form(
            key: _formkey,
            child:

              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[

                  Icon(Icons.person_outline, size: 120.0, color: Colors.green),
                  TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Peso em KG",
                        labelStyle: TextStyle(color: Colors.green)
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: weightController,
                    validator: (value){

                      if(value.isEmpty)
                        {
                          return "Insira seu peso";

                        }
                    },
                  ),

                  TextFormField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Altura em CM",
                        labelStyle: TextStyle(color: Colors.green)
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                    controller: heightController,
                    validator: (value){

                      if(value.isEmpty)
                      {
                        return "Insira sua altura";

                      }

                    },
                  ),

                  Padding(
                    padding: EdgeInsets.only(top:10.0, bottom: 10.0),
                    child:
                    Container(
                      height: 50.0,
                      child:
                      RaisedButton(
                        onPressed: () {

                          if(_formkey.currentState.validate())
                            {
                              calculate();

                            }

                        },
                        child: Text("Calcular", style: TextStyle(color: Colors.white, fontSize: 25.0), ),
                        color: Colors.green,
                      ),
                    ),
                  ),

                  Text(info,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                  )

                ],
              ),

            ),

      ),
    );
  }
}
