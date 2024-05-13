import 'package:calculator/constant.dart';
import 'package:calculator/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var userinput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: Colors.grey,
                      child: Text(
                        userinput.toString(),
                        style:
                            const TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Text(
                      answer.toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Mybutton(
                        title: 'AC',
                        onPress: () {
                          userinput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '+/-',
                        onPress: () {
                          userinput = '+/-';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '%',
                        onPress: () {
                          userinput += '%';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '/',
                        onPress: () {
                          userinput += '/';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '7',
                        onPress: () {
                          userinput += '7';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '8',
                        onPress: () {
                          userinput += '8';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '9',
                        onPress: () {
                          userinput += '9';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: 'x',
                        onPress: () {
                          userinput += 'x';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '4',
                        onPress: () {
                          userinput += '4';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '5',
                        onPress: () {
                          userinput += '5';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '6',
                        onPress: () {
                          userinput += '6';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '-',
                        onPress: () {
                          userinput += '-';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '1',
                        onPress: () {
                          userinput += '1';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '2',
                        onPress: () {
                          userinput += '2';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '3',
                        onPress: () {
                          userinput += '3';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '+',
                        onPress: () {
                          userinput += '+';
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Mybutton(
                        title: '0',
                        onPress: () {
                          userinput += '0';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '.',
                        onPress: () {
                          userinput += '.';
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: 'DEL',
                        onPress: () {
                          userinput =
                              userinput.substring(0, userinput.length - 1);
                          setState(() {});
                        },
                      ),
                      Mybutton(
                        title: '=',
                        onPress: () {
                          equalpress();
                          setState(() {});
                        },
                        color: const Color(0xffffa00a),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      )),
    );
  }

  void equalpress() {
    String finaluserinput = userinput;
    finaluserinput = userinput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finaluserinput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
