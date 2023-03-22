import 'package:bt/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:bt/screens/services/auth.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        title: const Text('Brunei Tourism'),
        backgroundColor: Colors.yellow[400],
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'logout',
            onPressed: () async {
              await _auth.signOut();
            }
          )
        ],
      ),
    );
  }
}
