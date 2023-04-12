import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong_tile%2F1.jpg?alt=media&token=6a7ff979-8585-4fe5-ad35-94a6ef4a7739',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong_tile%2F2.jpg?alt=media&token=f753932a-8859-445f-995d-67322e60ab1b',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong_tile%2F3.jpg?alt=media&token=235e6c50-f4c0-4d9d-a84e-220dd09469e9',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong_tile%2F4.jpg?alt=media&token=181a8668-6d78-47b1-a937-db9ab592bacd'
];
void main() => runApp(const TutongTile());

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

class TutongTile extends StatefulWidget {
  const TutongTile({super.key});

  @override
  State<TutongTile> createState() => _TutongTileState();
}

class _TutongTileState extends State<TutongTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tutong'),
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
