import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final Map bookDetails = ModalRoute.of(context)!.settings.arguments as Map;
     final String thumbnailUrl = 'https://covers.openlibrary.org/b/id/${bookDetails['cover_i']}-L.jpg';
    // final String bookTitle = bookDetails['title'];
    // final String publishDate = bookDetails['publish_date'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: Container(
        decoration:const BoxDecoration(
          gradient:LinearGradient(
           colors:[
             Color.fromARGB(255, 80, 180, 213),
             Color.fromARGB(255, 154, 188, 204),
             Color.fromARGB(255, 147, 118, 233),
             Color.fromARGB(255, 152, 213, 210),
             
             ],
             begin:Alignment.bottomLeft,
             end:Alignment.topRight,
          ) ,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Image.network(
                thumbnailUrl,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              Text(
                "Title: ${bookDetails["title"]}",
                style: const TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle:FontStyle.italic),
              ),
              const SizedBox(height: 16),
              Text(
                "Publish Date: ${bookDetails["publish_date"][0]}",
                 style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height:16),
              Text(
                "Edition Key: ${bookDetails["edition_key"][0]}",
                style: TextStyle(fontSize: 16),
              ),
             const  SizedBox(height:16),
              Text(
                "Language: ${bookDetails["language"]}",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height:16),
              Text(
                "Publisher: ${bookDetails["publisher"][0]}",
              ),
              const SizedBox(height:16),
              Text(
                "Author: ${bookDetails['author_name']}",
                 style:const TextStyle(fontSize: 17,
                    fontStyle: FontStyle.italic), 
                 ),
            ],
          ),
        ),
      ),
    );
  }
}


