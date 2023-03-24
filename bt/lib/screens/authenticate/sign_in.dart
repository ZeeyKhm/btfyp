import 'package:bt/screens/services/auth.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/loading.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthServices _auth = AuthServices();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //textfield state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 255, 237, 73),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 200.0,
                    ),
                    Image.asset(
                      'assets/Brunei.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    const SizedBox(
                      height: 200.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Email'),
                      validator: (val) => !EmailValidator.validate(val!, true)
                          ? 'Not a valid email.'
                          : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a password more than 6 chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              error = 'please enter a valid email';
                              loading = false;
                            }
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          setState(() => loading = true);
                          dynamic result = await _auth.signInAnon();
                          if (result == null) {
                            print('error signing in');
                            loading = false;
                          } else {
                            print('signed in');
                            print(result.uid);
                          }
                        },
                        child: const Text('Sign in Anon')),
                    Text(
                      error,
                      style: const TextStyle(color: Colors.red, fontSize: 14.0),
                    )
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
