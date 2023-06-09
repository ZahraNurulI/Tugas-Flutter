import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  List<int> number = [];

  int? total;
  int? totalm;
  int? totalx;
  double? totalbg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'Calculator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: Row(
          children : [
            Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            width: 500,
            child: Column(
              children: [
                TextField(
                  controller: controller1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'First number',
                    hintText: 'Enter your first number',
                    prefixIcon: Icon(Icons.onetwothree),
                    suffixIcon: Icon(Icons.keyboard_alt_outlined),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: controller2,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Second number',
                    hintText: 'Enter your second number',
                    prefixIcon: Icon(Icons.onetwothree),
                    suffixIcon: Icon(Icons.keyboard_alt_outlined),
                  ),
                ),
                SizedBox(height: 16),
                // add and substract
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // operator add
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            int? firstNumber;
                            int? secondNumber;

                            if (controller1.text.isNotEmpty) {
                              firstNumber = int.parse(controller1.text);
                            }
                            if (controller2.text.isNotEmpty) {
                              secondNumber = int.parse(controller2.text);
                            }
                            if (firstNumber != null && secondNumber != null) {
                              setState(() {
                                total = firstNumber! + secondNumber!;
                              });
                            } else {
                              setState(() {
                                total = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please fill first and second number'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: Text('+')),
                    ),
                    SizedBox(height: 16),
                    // operator substract
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            int? firstNumber;
                            int? secondNumber;

                            if (controller1.text.isNotEmpty) {
                              firstNumber = int.parse(controller1.text);
                            }
                            if (controller2.text.isNotEmpty) {
                              secondNumber = int.parse(controller2.text);
                            }
                            if (firstNumber != null && secondNumber != null) {
                              setState(() {
                                totalm = firstNumber! - secondNumber!;
                              });
                            } else {
                              setState(() {
                                totalm = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please fill first and second number'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: Text('-')),
                    )
                  ],
                ),

                SizedBox(height: 16),
                // multiply and division
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // operator multiply
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            int? firstNumber;
                            int? secondNumber;

                            if (controller1.text.isNotEmpty) {
                              firstNumber = int.parse(controller1.text);
                            }
                            if (controller2.text.isNotEmpty) {
                              secondNumber = int.parse(controller2.text);
                            }
                            if (firstNumber != null && secondNumber != null) {
                              setState(() {
                                totalx = firstNumber! * secondNumber!;
                              });
                            } else {
                              setState(() {
                                totalx = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please fill first and second number'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: Text('x')),
                    ),
                    SizedBox(height: 16),
                    // operator division
                    SizedBox(
                      height: 35,
                      child: ElevatedButton(
                          onPressed: () {
                            int? firstNumber;
                            int? secondNumber;

                            if (controller1.text.isNotEmpty) {
                              firstNumber = int.parse(controller1.text);
                            }
                            if (controller2.text.isNotEmpty) {
                              secondNumber = int.parse(controller2.text);
                            }
                            if (firstNumber != null && secondNumber != null) {
                              setState(() {
                                totalbg = firstNumber! / secondNumber!;
                              });
                            } else {
                              setState(() {
                                totalbg = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please fill first and second number'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            }
                          },
                          child: Text('/')),
                    )
                  ],
                ),
      ],
    ),
    ),
                SizedBox(height: 16),
                Container(
                  width: 500,
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('History', style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),),),
                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_sharp)),
                      SizedBox(height: 18),
                      Visibility(
                        visible: total != null,
                        child: Text(
                          'Hasil ${controller1.text} + ${controller2.text} = $total',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: totalm != null,
                        child: Text(
                          'Hasil ${controller1.text} - ${controller2.text} = $totalm',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: totalx != null,
                        child: Text(
                          'Hasil ${controller1.text} x ${controller2.text} = $totalx',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 8),
                      Visibility(
                        visible: totalbg != null,
                        child: Text(
                          'Hasil ${controller1.text} / ${controller2.text} = $totalbg',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
          ),
    );
  }

  void delete(int? index){

  }

}
