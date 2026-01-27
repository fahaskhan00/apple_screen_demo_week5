import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final String _validUsername = 'admin';
  final String _validPassword = 'password123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WELCOME')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(17.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Username',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return ' Enter Username';
                    } else {
                      return null;
                    }
                  },
                ),

                SizedBox(height: 5),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),

                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return ' Enter Password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 9),

                ElevatedButton(
                  onPressed: _checkLogin,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );    
  }

  void _checkLogin() async {
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text.trim();
      String password = _passwordController.text.trim();

      if (username == _validUsername && password == _validPassword) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setBool(SAVE_KEY_NAME, true);
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Incorrect Username Or Password'),
            backgroundColor: const Color.fromARGB(255, 244, 69, 57),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
