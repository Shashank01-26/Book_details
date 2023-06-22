import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final Map bookDetails = ModalRoute.of(context)!.settings.arguments as Map;
    // final String bookTitle = bookDetails['title'];
    // final String publishDate = bookDetails['publish_date'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Title: ${bookDetails["title"]}",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              "Publish Date: ${bookDetails["publish_date"][0]}",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
