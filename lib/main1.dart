import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import "package:app_1/book_details1.dart";

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
        await http.get(Uri.parse("https://openlibrary.org/search.json?q=All"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      docs = jsonResponse['docs'];

      print("API Response: ${response.body}");

      setState(() {
        titles = docs.map((doc) => doc['title']).toList().cast<String>();

        print("fetched Titles:$titles");
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
        title: Text("Book List"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(titles[index]),
              onTap: () => navigateToBookDetailsPage(titles[index], index),
            );
          },
        ),
      ),
    );
  }
}

