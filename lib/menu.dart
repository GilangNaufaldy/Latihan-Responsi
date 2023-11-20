import 'package:flutter/material.dart';
import 'package:latihan_responsi/page_list_news.dart';

import 'bentuk.dart';

class Berita extends StatelessWidget {
  const Berita({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(children: [
            MenuCard(
             berita: PageListNews(
                  name: "News",
                  image:
                  "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2"),
            ),


          ]),
        ),
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.berita});
  final Bentuk berita;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return berita;
        }));
      },
      child: Card(
        child: Column(children: [
          SizedBox(
              height: 200, width: 200, child: Image.network(berita.image)),
          Text(berita.name)
        ]),
      ),
    );
  }
}