import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/temburong_tile%2F1.jpg?alt=media&token=6c50dbc2-7aea-4c35-b10f-aaa7476439f6',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/temburong_tile%2F2.jpg?alt=media&token=4f3c9e0d-cf08-4012-8258-441b9b844de0',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/temburong_tile%2F3.jpg?alt=media&token=306dd15d-f259-4503-9b8a-c9456419fbc9',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/temburong_tile%2F4.jpg?alt=media&token=b14ff297-616e-4154-a2d2-16ce55f10fb5'
];
void main() => runApp(const TemburongTile());

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

class TemburongTile extends StatefulWidget {
  const TemburongTile({super.key});

  @override
  State<TemburongTile> createState() => _TemburongTileState();
}

class _TemburongTileState extends State<TemburongTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Temburong'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
