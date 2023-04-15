import 'package:flutter/material.dart';
import 'recommed.dart';
import 'header_with_searchbox.dart';
import 'featured_news.dart';
import 'title_with_more_button.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const HomeTile());

class HomeTile extends StatelessWidget {
  const HomeTile({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreButton(
            title: 'News',
            press: () async {
              Uri.parse('https://www.instagram.com/brunei.tourism/');
            },
          ),
          FeaturedNews(),
          TitleWithMoreButton(
            title: 'Recommended',
            press: () async {
              Uri.parse(
                  'https://www.instagram.com/p/Cn3haoSpeIO/?utm_source=ig_web_copy_link');
            },
          ),
          Recommend(),
          SizedBox(
            height: 20,
          ),
          // CarouselSlider(
          //   options: CarouselOptions(
          //     autoPlay: true,
          //     aspectRatio: 2.0,
          //     enlargeCenterPage: true,
          //   ),
          //   items: imageSliders,
          // ),
          // const SizedBox(
          //   height: 50,
          // ),
          // const Card(
          //   color: Colors.yellow,
          //   child: Text(
          //     'Whats New',
          //   ),
          // ),
        ],
      ),
    );
  }
}
