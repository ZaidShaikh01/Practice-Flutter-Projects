import 'package:calculator/src/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userAnswer = '';
  var userQuestion1 = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8edeb),
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userQuestion1,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerRight,
                  child: Text(
                    userAnswer,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                    itemBuilder: (BuildContext contex, int index) {
                      if (index == 0) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestion1 = '';
                              userAnswer = '';
                            });
                          },
                          textButton: buttons[index],
                          color: Color(0xffc1121f),
                          textcolor: Colors.white,
                        );
                      }
                      if (index == 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              if (userQuestion1.isNotEmpty) {
                                userQuestion1 = userQuestion1.substring(
                                    0, userQuestion1.length - 1);
                              }
                            });
                          },
                          textButton: buttons[index],
                          color: Color(0xfffb5607),
                          textcolor: Colors.white,
                        );
                      }
                      if (index == buttons.length - 1) {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              equalPress();
                            });
                          },
                          textButton: buttons[index],
                          color: Color(0xff4cc9f0),
                          textcolor: Colors.white,
                        );
                      } else {
                        return Buttons(
                          buttonTapped: () {
                            setState(() {
                              userQuestion1 += buttons[index];
                            });
                          },
                          color: isOperator(buttons[index])
                              ? const Color(0xffe07a5f)
                              : const Color(0xfffec89a),
                          textcolor: isOperator(buttons[index])
                              ? Colors.white
                              : const Color(0xfffefae0),
                          textButton: buttons[index],
                        );
                      }
                    }),
              )),
        ],
      ),
    );
  }

  bool isOperator(String s) {
    if (s == '%' || s == '/' || s == '+' || s == '-' || s == 'x') {
      return true;
    }
    return false;
  }

  void equalPress() {
    String finalQuestion = userQuestion1;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
