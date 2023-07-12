import 'package:flutter/material.dart';
import 'package:app_1/customCardPaint.dart';
import 'package:app_1/rating_bar.dart';

Widget reUseCard(Color cardColour, double bookRating, List<String> titles,
    List<dynamic> docs, int index, BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    shadowColor: Colors.grey.withOpacity(0.5),
    elevation: 9,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
    color: cardColour,
    child: Container(
      height: 114,
      width: 300,
      child: CustomPaint(
        painter: customCardPaint(
            24.0,
            Color.fromARGB(208, 128, 147, 204).withOpacity(0.4),
            Color.fromARGB(255, 180, 99, 99).withOpacity(0.7)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RatingBar(rating: bookRating.toDouble()),
              const SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 240, 245, 250),
                      Color.fromARGB(255, 121, 140, 173),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(99, 0, 0, 0),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://covers.openlibrary.org/b/id/${docs[index]['cover_i']}-L.jpg',
                    ),
                    radius: 30,
                  ),
                  title: Text(titles[index]),
                  subtitle:
                      Text(docs[index]['author_name']?.first ?? 'Unknown'),
                
                  onTap: () {
                    // navigateToBookDetailsPage(titles[index], index);
                    Navigator.pushNamed(context, '/bookDetails',
                        arguments: docs[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
