import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _tel1 = Uri.parse('tel:+1-555-010-999');

void main() => runApp(const EmergencyTile());

class EmergencyTile extends StatelessWidget {
  const EmergencyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // clipBehavior is necessary because, without it, the InkWell's animation
        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
        // This comes with a small performance cost, and you should not set [clipBehavior]
        // unless you need it.
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            _launchTel1;
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchTel1() async {
  if (!await launchUrl(_tel1)) {
    throw Exception('Could not launch $_tel1');
  }
}
