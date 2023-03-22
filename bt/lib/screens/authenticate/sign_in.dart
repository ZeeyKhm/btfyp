import 'package:bt/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        elevation: 0.0,
        title: const Text('Sign in to Brunei Tourism'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: ElevatedButton(
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('error signing in');
              } else {
                print('signed in');
                print(result);
              }
            },
            child: const Text('Sign in Anon')),
      ),
    );
  }
}
