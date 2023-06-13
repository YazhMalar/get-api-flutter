import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final List<Map<String, String>> _userList = [
    {'username': 'yazhini', 'password': '12'},
    {'username': 'tamil', 'password': '34'},
    {'username': 'kausik', 'password': '56'},
    {'username': 'sindhu', 'password': '78'},
  ];
  String _errorMessage = '';

  void _login() {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text;
      final password = _passwordController.text;

      Map<String, String>? user;

      for (final userData in _userList) {
        if (userData['username'] == username &&
            userData['password'] == password) {
          user = userData;
          break;
        }
      }

      if (user != null) {
        setState(() {
          _errorMessage = '';
        });

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
