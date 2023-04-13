import 'package:flutter/material.dart';
import 'package:brunei_tourism/models/profile.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileTile extends StatelessWidget {
  final Profile profile;
  const ProfileTile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: InkWell(
        child: Card(
          child: Container(
            decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.yellowAccent)),
                color: Colors.white10),
            child: const ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.yellow,
              ),
              title: Text('profile!.gender'),
              subtitle: Text('profile.age'),
            ),
          ),
        ),
        onTap: () {
          Uri.parse('tel:+999');
        },
      ),
    );
  }
}
