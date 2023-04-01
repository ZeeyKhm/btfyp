import 'package:flutter/material.dart';
import 'package:brunei_tourism/models/profile.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;
  const ProfileTile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.yellow,
          ),
          title: Text('profile!.gender'),
          subtitle: Text('profile.age'),
        ),
      ),
    );
  }
}
