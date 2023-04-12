import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait_tile%2F1.jpg?alt=media&token=1bc0b37c-c02b-42f0-81b8-5f8f77b604e4',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait_tile%2F2.jpg?alt=media&token=dc275205-9ab3-47ff-ad33-ba1406b25467',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait_tile%2F3.jpg?alt=media&token=b1493d7a-def3-48ee-adad-3847bba0f736',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait_tile%2F4.jpg?alt=media&token=10dec197-cf72-4e10-b9da-2d26caebbb1f'
];
void main() => runApp(const BelaitTile());

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

class BelaitTile extends StatefulWidget {
  const BelaitTile({super.key});

  @override
  State<BelaitTile> createState() => _BelaitTileState();
}

class _BelaitTileState extends State<BelaitTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Belait'),
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
