import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'D A F T A R  K E H A D I R A N',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: Icon(Icons.menu_rounded),
            actions: const [
              Icon(Icons.more_vert)
            ],
          ),
          body: ListView.builder(
            itemCount: 33,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(top: 8, left: 8, right: 8),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                          width: 0.5
                      )
                  ),
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: index % 2 == 0 ? Colors.indigo.withOpacity(0.5) : Colors.blueGrey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Icon(Icons.person),
                      ),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Absen $index',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                              ('Checklist untuk mengisi kehadiran')
                          ),
                        ],
                      ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.check_box_outlined)),
                      Icon(Icons.keyboard_arrow_right)
                    ],
                  )
              );
            },
          ),
        );
  }
}
