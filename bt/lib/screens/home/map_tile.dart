import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bm_tile.dart';
import 'tutong_tile.dart';
import 'temburong_tile.dart';
import 'belait_tile.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/map_tile%2F1.jpg?alt=media&token=48769043-32c2-40d0-846e-a7bbe2391e3a',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/map_tile%2F2.jpg?alt=media&token=0562a0e8-4fcc-4d7e-a8e6-6d6c688464b2',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/map_tile%2F3.jpg?alt=media&token=e355ae2c-ed3f-47b4-8732-357ee6e7de28',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/map_tile%2F4.jpg?alt=media&token=c64d359e-2dc3-4243-bc56-137e3d554078'
];
void main() => runApp(const MapTile());

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
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
          ),
        ))
    .toList();

class MapTile extends StatelessWidget {
  const MapTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const SizedBox(
          height: 50.0,
        ),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
        const SizedBox(
          height: 50.0,
        ),
        const Card(
          elevation: 0,
          child: Text(
            'Brunei Darussalam Districts',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        InkWell(
          child: Card(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide()), color: Colors.black12),
              child: const ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Brunei Muara District'),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BmTile()));
          },
        ),
        InkWell(
          child: Card(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide()), color: Colors.black12),
              child: const ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Tutong District'),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TutongTile()));
          },
        ),
        InkWell(
          child: Card(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide()), color: Colors.black12),
              child: const ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Temburong District'),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TemburongTile()));
          },
        ),
        InkWell(
          child: Card(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide()), color: Colors.black12),
              child: const ListTile(
                leading: FlutterLogo(size: 72.0),
                title: Text('Belait District'),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BelaitTile()));
          },
        ),
      ],
    );
  }
}
