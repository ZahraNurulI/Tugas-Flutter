import 'package:flutter/material.dart';
import 'package:tugas_ki/app_theme.dart';
import 'package:tugas_ki/my_bio.dart';
import 'register_screen.dart';
import 'package:tugas_ki/list_screen.dart';
import 'login_page.dart';
import 'calculator_screen.dart';
import 'history.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final lightTheme = AppLightTheme();
    final darkTheme = AppDarkTheme();
    return MaterialApp(
      title: 'Tugas KI',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: lightTheme.primarySwatch,
          appBarTheme: lightTheme.appBarTheme,
          scaffoldBackgroundColor: lightTheme.scaffoldBackgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: darkTheme.primarySwatch,
        appBarTheme: darkTheme.appBarTheme,
        scaffoldBackgroundColor: darkTheme.scaffoldBackgroundColor
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/bio',
      routes:  {
        '/': (context) => const MyHomePage(title: 'Week 3'),
        '/register': (context) => const RegisterScreen(),
        '/list' : (context) => const ListScreen(),
        '/login' : (context) => const LoginPage(),
        '/history' : (context) => const History(),
        '/calculator' : (context) => const CalculatorScreen(),
        '/bio' : (context) => const ShoppingListScreen(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
