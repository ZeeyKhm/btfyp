import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F2.jpg?alt=media&token=5822a3bc-60b8-4052-bfb0-899a264f57e6',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F3.jpg?alt=media&token=38d07a36-d2c4-4ea0-b67a-e05b6d45637a',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F4.jpg?alt=media&token=618feb83-9b24-411c-bc32-15366f839ad9'
];
void main() => runApp(const HomeTile());

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class HomeTile extends StatelessWidget {
  const HomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
        const SizedBox(
          height: 50,
        ),
        const Card(
          color: Colors.yellow,
          child: Text(
            'Whats New',
          ),
        ),
      ],
    );
  }
}
