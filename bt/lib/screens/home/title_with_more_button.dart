import 'package:flutter/material.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({
    super.key,
    required this.title,
    required this.press,
  });

  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          TitleWithCustomUnderline(
            text: title,
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
              textStyle: const TextStyle(color: Colors.white),
            ),
            onPressed: press,
            child: const Text('More'),
          ),
        ],
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(right: 5),
              height: 7,
              color: Colors.yellow.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
