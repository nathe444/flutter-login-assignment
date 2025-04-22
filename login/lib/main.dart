import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData.dark(), // Dark theme for style
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Hardcoded credentials
  final String correctEmail = "test@example.com";
  final String correctPassword = "123456";

  void _validateLogin() {
    if (_formKey.currentState!.validate()) {
      String inputEmail = emailController.text.trim();
      String inputPassword = passwordController.text;

      if (inputEmail == correctEmail && inputPassword == correctPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('✅ Login Successful!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Email is required';
                  if (!value.contains('@')) return 'Enter a valid email';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Password is required';
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _validateLogin,
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
