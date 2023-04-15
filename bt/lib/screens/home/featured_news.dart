import 'package:flutter/material.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F1.jpg?alt=media&token=42b9544b-912c-4977-8a31-a79aeefe58d7',
            title: 'Masjid',
            sub: 'BSB',
            date: '2023',
          ),
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F2.jpg?alt=media&token=5822a3bc-60b8-4052-bfb0-899a264f57e6',
            title: 'Masjid',
            sub: 'BSB',
            date: '2023',
          ),
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F3.jpg?alt=media&token=38d07a36-d2c4-4ea0-b67a-e05b6d45637a',
            title: 'Masjid',
            sub: 'BSB',
            date: '2023',
          ),
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/maps_tile%2F4.jpg?alt=media&token=618feb83-9b24-411c-bc32-15366f839ad9',
            title: 'Masjid',
            sub: 'BSB',
            date: '2023',
          ),
        ],
      ),
    );
  }
}

class News extends StatelessWidget {
  const News({
    super.key,
    required this.image,
    required this.title,
    required this.sub,
    required this.date,
    required this.press,
  });

  final String image, title, sub, date;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 50,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.network(
              image,
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Colors.yellow.withOpacity(0.23),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '$title\n'.toUpperCase(),
                            style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                          text: '$sub'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.yellow.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '$date',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: Colors.yellow),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
