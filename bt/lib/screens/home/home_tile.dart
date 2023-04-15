import 'package:flutter/material.dart';
import 'recommed.dart';
import 'header_with_searchbox.dart';
import 'featured_news.dart';
import 'title_with_more_button.dart';

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
          const FeaturedNews(),
          TitleWithMoreButton(
            title: 'Recommended',
            press: () async {
              Uri.parse(
                  'https://www.instagram.com/p/Cn3haoSpeIO/?utm_source=ig_web_copy_link');
            },
          ),
          const Recommend(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
