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
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F7.jpg?alt=media&token=99d950a6-e4ce-4e04-8468-01ac3315e89a',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F8.jpg?alt=media&token=309590b7-fd52-4ac2-9661-93295079cc23',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F9.jpg?alt=media&token=eac3e358-1f7c-4a2f-af59-e4dce616bc93',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F10.jpg?alt=media&token=9d6e64e0-5687-49ab-9d55-084bd2980eb9',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F11.jpg?alt=media&token=7885551c-b996-4b93-8e5c-908a05450217',
            press: () {},
          ),
          Recommends(
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F12.jpg?alt=media&token=ac39a1a9-ed4b-420f-88fc-29bdbd3fe28d',
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
        margin: const EdgeInsets.only(
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
