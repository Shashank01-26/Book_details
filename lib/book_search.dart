import 'dart:convert';

import 'package:app_1/reUsable_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookSearch extends SearchDelegate<String> {
  final List<String> titles;
  final List<dynamic> docs;
  BookSearch({
    required this.titles,
    required this.docs,
  });
  late Future<List<String>> _responseList;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          _responseList = fetchTitles(query);
          showResults(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: _responseList,
        builder: (context, snapshot) {
          print("Mylog ${snapshot.data}");
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
             final title = snapshot.data;
              
              return reUseCard(
                  Colors.tealAccent, 4.0,title!, docs, index, context);
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }

  Future<List<String>> fetchTitles(String query) async {
    final response = await http
        .get(Uri.parse("https://openlibrary.org/search.json?q=$query"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      var docs = jsonResponse['docs'];
      return docs.map((doc) => doc['title']).toList().cast<String>();
    }
    return List.empty();
  }
}
