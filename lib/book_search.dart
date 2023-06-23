import 'package:flutter/material.dart';

class BookSearch extends SearchDelegate<String> {
  final Function(String) onSearch;
  final List<String> titles;
  final List<dynamic> docs;
  BookSearch(this.onSearch, this.titles, this.docs);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          onSearch('');
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
     final suggestionList = query.isEmpty
        ? []
        : titles
            .where(
              (title) => title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final title = suggestionList[index];
        final bookIndex = titles.indexOf(title);
        final book = docs[bookIndex];

        return GestureDetector(
          onTap: () {
            close(context, title);
            Navigator.pushNamed(context, '/bookDetails', arguments: book);
          },
          child: ListTile(
            title: Text(title),
            subtitle: Text(book['author_name']?.first ?? 'Unknown'),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? []
        : titles
            .where(
              (title) => title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final title = suggestionList[index];

        return ListTile(
          title: Text(title),
          onTap: () {
            query = title;
            onSearch(query);
            close(context, title);
            Navigator.pushNamed(
              context,
              '/bookDetails',
              arguments: docs[titles.indexOf(title)],
            );
          },
        );
      },
    );
  }
}
