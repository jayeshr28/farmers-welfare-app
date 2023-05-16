import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'news_class.dart';

class NewsCard extends StatelessWidget {
  final Article artical;

  const NewsCard({
    Key? key,
    required this.artical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Container(
              // margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                              artical.urlToImage!,
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Text(
                    artical.title!,
                    style: GoogleFonts.poppins(
                        fontSize: 10, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                artical.description!,
                style: GoogleFonts.poppins(fontSize: 11),
              ),
            )
          ],
        ));
  }
}
