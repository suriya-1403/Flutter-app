import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _output = "0";
  String operand;
  double num1, num2;
  ButtonPress(String x) {
    if (x == "Clear") {
      _output = "0";
      operand="";
      num1 = num2 = 0.0;
    } else if (x == "+" || x == "-" || x == "*" || x == "/") {
      num1 = double.parse(output);
      operand = x;
      _output = "0";
    } else if (x == ".") {
      if (_output.contains(".")) {
        print("Already . Contains");
        return;
      } else {
        _output = _output + x;
      }
    } else if (x == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      } else if (operand == "-") {
        _output = (num1 - num2).toString();
      } else if (operand == "*") {
        _output = (num1 * num2).toString();
      } else if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + x;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(4);
    });
  }

  String output = "0";

  Widget buildButton(String x) {
    return new Expanded(
      child: new OutlineButton(
        child: new Text(
          x,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => ButtonPress(x),
        padding: new EdgeInsets.all(24.00),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(children: <Widget>[
          new Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: new TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new Expanded(
            child: new Divider(),
          ),
          new Column(
            children: [
              Row(
                children: [
                  buildButton("9"),
                  buildButton("8"),
                  buildButton("7"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("6"),
                  buildButton("5"),
                  buildButton("4"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: [
                  buildButton("3"),
                  buildButton("2"),
                  buildButton("1"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("."),
                  buildButton("0"),
                  buildButton("00"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: [
                  buildButton("Clear"),
                  buildButton("="),
                ],
              ),
            ],
          )
        ])));
  }
}
