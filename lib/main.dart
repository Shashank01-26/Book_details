import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:app_1/book_details.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
      routes: {
        '/bookDetails': (context) => BookDetailsPage(),
      },
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  List<String> titles = [];
  List<dynamic> docs = [];
  Future<List<String>> fetchTitles() async {
    final response =
        await http.get(Uri.parse("https://openlibrary.org/search.json?q=rich dad poor dad"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      docs = jsonResponse['docs'];

      // print("API Response: ${response.body}");

      setState(() {
        titles = docs.map((doc) => doc['title']).toList().cast<String>();

        // print("fetched Titles:$titles");
      });
    }
    return titles;
  }

  @override
  void initState() {
    fetchTitles();
    super.initState();
  }

  void navigateToBookDetailsPage(String bookTitle, int index) {
    Navigator.pushNamed(context, '/bookDetails', arguments: docs[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Color.fromARGB(255, 82, 94, 255),
        title: Text("Book List"),
        
        
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Color.fromARGB(240, 65, 170, 245),
              Color.fromARGB(181, 94, 68, 225),
              Color.fromARGB(251, 104, 71, 239),
              Color.fromARGB(241, 30, 110, 190),

            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
            child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              final card_colour = Color.fromARGB(247, 187, 187, 188);
              return Card(
                shadowColor:Color.fromARGB(255, 43, 125, 158),
                elevation:9,
                // borderOnForeground: ,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical:8),
                color:card_colour,
                child:ListTile(
                leading:Image.network(
              'https://covers.openlibrary.org/b/id/${docs[index]['cover_i']}-M.jpg',
              width:50,
              height:50,
                ),
                
                title: Text(titles[index]),
                onTap: () => navigateToBookDetailsPage(titles[index], index),
              ));
            },
          ),
        ),
      ),
    );
  }
}

