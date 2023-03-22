import 'package:bt/screens/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();

  //textfield state
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[40],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        elevation: 0.0,
        title: const Text('Sign in to Brunei Tourism'),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
            },
            icon: const Icon(
              Icons.person,
            ), label: const Text('Register'),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              const SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => password = val);
                },
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                onPressed: () async { 
                  print(email);
                  print(password);
                 },
                child: Text('Sign In',
                style: TextStyle(color: Colors.white),)
                ),
            ],
          ),
        ),
        // child: ElevatedButton(
        //     onPressed: () async {
        //       dynamic result = await _auth.signInAnon();
        //       if (result == null) {
        //         print('error signing in');
        //       } else {
        //         print('signed in');
        //         print(result.uid);
        //       }
        //     },
        //     child: const Text('Sign in Anon')),
      ),
    );
  }
}
