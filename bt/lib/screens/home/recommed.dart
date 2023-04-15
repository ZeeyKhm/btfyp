import 'package:flutter/material.dart';

class Recommend extends StatelessWidget {
  const Recommend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
            press: () {},
          ),
        ],
      ),
    );
  }
}

class Recommends extends StatelessWidget {
  const Recommends({
    super.key,
    required this.image,
    required this.press,
  });

  final String image;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 10,
          bottom: 10,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
