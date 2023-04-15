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
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F1.jpg?alt=media&token=dbc8b554-9880-4a7b-a0e2-6acd00d70e37',
            title: 'SOAS',
            sub: 'Mosque',
            date: '10/4/23',
          ),
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F2.jpg?alt=media&token=c4d4e114-e1dd-4220-9c06-427edec58b14',
            title: 'Oceania N..',
            sub: 'Cruise S..',
            date: '4/4/23',
          ),
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F3.jpg?alt=media&token=2449c8bc-2742-4ec9-baa6-32249e54e52d',
            title: 'Balai Kha..',
            sub: 'Sultan H..',
            date: '14/2/23',
          ),
          News(
            press: () {},
            image:
                'https://firebasestorage.googleapis.com/v0/b/btfyp-b453d.appspot.com/o/home_tile%2F4.jpg?alt=media&token=f3706965-2809-4e2b-b583-623b73ca32c2',
            title: 'Milky W..',
            sub: 'Star Gaz..',
            date: '27/1/23',
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
      margin: const EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 50,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
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
                  const Spacer(),
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
