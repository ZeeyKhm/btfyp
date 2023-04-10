import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/brunei_muara%2FSultan_Omar_Ali_Saifuddien_Mosque%3B_2002.jpg?alt=media&token=678080b3-cb68-4384-b4e3-64425b380e7f',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/brunei_muara%2FGadong_Mall_-_Brunei.jpg?alt=media&token=6691fb68-7f68-47cf-a63f-409812e25da0',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/brunei_muara%2FOne_River_Side_(30122021).jpg?alt=media&token=a1d5af1c-9eef-4722-98e6-e0f5bbc8a76d',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/brunei_muara%2F1280px-BN-muara-hafen.jpg?alt=media&token=65002728-7eee-4965-9b65-1d0f831763c8'
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
