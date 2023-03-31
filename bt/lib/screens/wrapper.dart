import 'package:bt/models/user.dart';
import 'package:bt/screens/home/home.dart';
import 'package:bt/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);

    //return const Authenticate();
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
