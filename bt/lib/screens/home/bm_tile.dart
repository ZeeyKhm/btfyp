import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/bm_tile%2F1.jpg?alt=media&token=7bb982b5-e546-4320-8ce7-86d185c6b6b5',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/bm_tile%2F2.jpg?alt=media&token=58d59b66-ed0e-4e44-9724-ad0ea389a0c5',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/bm_tile%2F3.jpg?alt=media&token=5c1116f5-d9d2-4fa7-a8d7-23a3dae6807b',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/bm_tile%2F4.jpg?alt=media&token=ea16024e-d921-4f07-a2a4-ece0b10a6750'
];
void main() => runApp(const BmTile());

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

class BmTile extends StatefulWidget {
  const BmTile({super.key});

  @override
  State<BmTile> createState() => _BmTileState();
}

class _BmTileState extends State<BmTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Brunei Muara'),
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
