import 'package:flutter/material.dart';
import 'package:petshop/model/datamodel.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Customer customer = Customer(
    userType: "Customer",
    signUpStatus: true,
    name: "testUser",
    email: "xyz@gmail.com",
    password: "12345678",
    mobileNo: "",
    mapLocation: "",
    latitude: "",
    longitude: "",
    address: "",
    token: "",
    countryCode: "+91,IN",
  );

  void _submit() {
    final enteredEmail = _emailController.text.trim();
    final enteredPassword = _passwordController.text.trim();

    if (enteredEmail == customer.email && enteredPassword == customer.password) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Failed. Please check your credentials.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

