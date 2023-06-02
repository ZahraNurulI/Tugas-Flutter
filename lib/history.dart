import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  List<String> total = [];
  int? ttl;
  double? totalbg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        automaticallyImplyLeading: false,
      ),

      body: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.all(16),
                  height: 40,
                  child: TextField(
                    controller: controller1,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First number',
                        hintText: 'Enter your first number',
                        prefixIcon: Icon(Icons.onetwothree)
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  margin: EdgeInsets.all(16),
                  height: 40,
                  child: TextField(
                    controller: controller2,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Second number',
                        hintText: 'Enter your first number',
                        prefixIcon: Icon(Icons.onetwothree)
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
    children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => math(operator: '+'), child: Text('+'),),
                    ElevatedButton(onPressed: () => math(operator: '-'), child: Text('-'),),
                  ],
                ),
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => math(operator: '/'), child: Text('/'),),
                    ElevatedButton(onPressed: () => math(operator: '*'), child: Text('x'),),
                  ],
                ),],),
                  Visibility(
                    visible: ttl != null,
                    child: SizedBox(height: 16,),),
                  Row(
                    children: [
                      Expanded(child: Text('History', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),),),
                      IconButton(onPressed: () {
                        setState(() {
                          total.clear();
                        });
                      },
                        icon: Icon(
                          Icons.clear_all,
                        ),),
                    ],
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: total.length,
                      itemBuilder: (context, index) {
                        final item = total[index];
                        return ListTile(
                          title: Text(item),
                          trailing: IconButton(
                            onPressed: (){
                              setState(() {
                                total.removeAt(index);
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                            ),
                          ),
                        );
                      },
                    ),),
    ], ),
    );
  }

  math({required String operator}) {
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
        switch(operator) {
          case '+':
            ttl = firstNumber! + secondNumber!;
            total.add(
                'Hasil dari ${controller1.text} + ${controller2.text} = $ttl');
            break;
          case '-':
            ttl = firstNumber! - secondNumber!;
            total.add(
                'Hasil dari ${controller1.text} - ${controller2.text} = $ttl');
            break;
          case '/':
            totalbg = firstNumber! / secondNumber!;
            total.add(
                'Hasil dari ${controller1.text} / ${controller2.text} = $totalbg');
            break;
          case '*':
            ttl = firstNumber! * secondNumber!;
            total.add(
                'Hasil dari ${controller1.text} x ${controller2.text} = $ttl');
            break;
          default:
            ttl = null;
        }
      });
    } else {
      setState(() {
        ttl = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill first and second number'),
            duration: const Duration(seconds: 3),
          ),
      );
  }
  }

}

