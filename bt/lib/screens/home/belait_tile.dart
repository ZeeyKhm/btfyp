import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait%2FSeria_Energy_Lab_(2).jpg?alt=media&token=29a8f158-5e11-488f-9fb9-f9d195cefd49',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait%2FLuagan_Lalak_Forest_Recreational_Park_(1).jpg?alt=media&token=eb43e698-a07a-489c-a48d-3ea1e505fa49',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait%2FKuala_Belait_at_Night_(18623608099).jpg?alt=media&token=d0a2cc84-6366-4df5-914c-4a3afc1010a1',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/belait%2FKuala_Belait_15_July_2022_15.jpg?alt=media&token=412f344c-97b9-446e-8f5f-813bf27097c7'
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
