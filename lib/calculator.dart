import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var text) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(), primary: Colors.green),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        child: Text(text),
      ),
      onPressed: () {
        setState(() {
          result = result + text;
        });
      },
    );
  }

  clearAll() {
    setState(() {
      result = "";
    });
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(
                right: 14,
                top: 80,
                left: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: result,
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.pink, width: 4),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(width: 50, height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: clearAll,
                        child: Text("C"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent.shade400,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      ElevatedButton(
                        child: Text('AC'),
                        onPressed: clear,
                        style: ElevatedButton.styleFrom(
                            // shape: CircleBorder(),
                            primary: Colors.purple,
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      btn("%"),
                      btn("/"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        btn("7"),
                        btn("8"),
                        btn("9"),
                        btn("*"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        btn("4"),
                        btn("5"),
                        btn("6"),
                        btn("-"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        btn("1"),
                        btn("2"),
                        btn("3"),
                        btn("+"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2, vertical: 1),
                          child: btn("0"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 30,
                          ),
                          child: btn(
                            ".",
                          ),
                        ),
                        ElevatedButton(
                          child: Text('='),
                          onPressed: output,
                          style: ElevatedButton.styleFrom(
                              // shape: CircleBorder(),
                              primary: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 55, vertical: 20),
                              textStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
