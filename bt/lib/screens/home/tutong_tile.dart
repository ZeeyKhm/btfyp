import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong%2F2019-09-24_20.15.43.jpg?alt=media&token=b0a97f19-575b-48cc-8bd1-6051ce0fe86d',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong%2FTaman_Seri_Warisan_Emas.jpg?alt=media&token=259eaf19-1bae-4f3f-844e-5abd463d7e24',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong%2FHospital_pmmpmhamb_02.08.2018.jpg?alt=media&token=0a5aaf25-1c8d-45f0-aab3-2a339512b2cd',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/tutong%2FTutong_River_(15042022).jpg?alt=media&token=c43b882a-38e1-4434-97a4-aeeedfbfe254'
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
