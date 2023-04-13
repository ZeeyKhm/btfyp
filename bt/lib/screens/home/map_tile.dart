import 'package:brunei_tourism/screens/home/belait_map.dart';
import 'package:brunei_tourism/screens/home/bm_map.dart';
import 'package:brunei_tourism/screens/home/temburong_map.dart';
import 'package:brunei_tourism/screens/home/tutong_map.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'bm_tile.dart';
import 'tutong_tile.dart';
import 'temburong_tile.dart';
import 'belait_tile.dart';

final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F2.jpg?alt=media&token=5822a3bc-60b8-4052-bfb0-899a264f57e6',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F3.jpg?alt=media&token=38d07a36-d2c4-4ea0-b67a-e05b6d45637a',
  'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F4.jpg?alt=media&token=618feb83-9b24-411c-bc32-15366f839ad9'
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
                  border: Border(left: BorderSide(color: Colors.yellowAccent)),
                  color: Colors.white10),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Image.asset('assets/images/bm.png', fit: BoxFit.cover),
                ),
                title: const Text('Brunei Muara District'),
                trailing: OutlinedButton(
                  child: const Text('Map'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const BmMap()));
                  },
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BmTile()));
          },
        ),
        InkWell(
          child: Card(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.yellowAccent)),
                  color: Colors.white10),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Image.asset('assets/images/tutong.png',
                      fit: BoxFit.cover),
                ),
                title: const Text('Tutong District'),
                trailing: OutlinedButton(
                  child: const Text('Map'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TutongMap()));
                  },
                ),
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
                  border: Border(left: BorderSide(color: Colors.yellowAccent)),
                  color: Colors.white10),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Image.asset('assets/images/temburong.png',
                      fit: BoxFit.cover),
                ),
                title: const Text('Temburong District'),
                trailing: OutlinedButton(
                  child: const Text('Map'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TemburongMap()));
                  },
                ),
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
                  border: Border(left: BorderSide(color: Colors.yellowAccent)),
                  color: Colors.white10),
              child: ListTile(
                leading: ConstrainedBox(
                  constraints: const BoxConstraints(),
                  child: Image.asset('assets/images/belait.png',
                      fit: BoxFit.cover),
                ),
                title: const Text('Belait District'),
                trailing: OutlinedButton(
                  child: const Text('Map'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BelaitMap()));
                  },
                ),
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
