import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _password = true;
  bool _pass = true;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text(          'Register Page',
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/ramadhan.jpeg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container (
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 15, bottom: 15),
            color: Colors.white.withOpacity(0.5),
            width: 600,
            height:double.infinity,
            child : Column (
              children: [
                const Image(height: 160, image: AssetImage("images/profil.jpg"),
                ),

                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.people),
                    suffixIcon: Icon(Icons.keyboard),
                    labelText: 'Username',
                    hintText: 'Enter your name',
                  ),
                ),

                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.keyboard),
                    labelText: 'Email',
                    hintText: 'youremail@gmail.com',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: _password,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _password = !_password;
                        });
                      },
                      icon: !_password
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: _pass,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _pass = !_pass;
                        });
                      },
                      icon: !_pass
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 350,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            overlayColor:
                            MaterialStateProperty.all(Colors.indigo),
                          ),
                          child: const Text('Register'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 350,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                width: 3, color: Colors.blueGrey),
                          ),
                          onPressed: () {},
                          child: const Text('Back to login'),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
