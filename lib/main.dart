// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:app_1/book_details.dart';
// import 'package:app_1/customCardPaint.dart';
// import 'package:app_1/rating_bar.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomepage(),
//       routes: {
//         '/bookDetails': (context) => BookDetailsPage(),
//       },
//     );
//   }
// }

// class MyHomepage extends StatefulWidget {
//   @override
//   _MyHomepageState createState() => _MyHomepageState();
// }

// class _MyHomepageState extends State<MyHomepage> {
//   List<String> titles = [];
//   List<dynamic> docs = [];
//   Future<List<String>> fetchTitles() async {
//     final response = await http
//         .get(Uri.parse("https://openlibrary.org/search.json?q=Harry Potter"));
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
//       docs = jsonResponse['docs'];

//       setState(() {
//         titles = docs.map((doc) => doc['title']).toList().cast<String>();
//       });
//     }
//     return titles;
//   }

//   void deleteBook(int index) {
//     setState(() {
//       titles.removeAt(index);
//       docs.removeAt(index);
//     });
//   }

//   @override
//   void initState() {
//     fetchTitles();
//     super.initState();
//   }

//   void navigateToBookDetailsPage(String bookTitle, int index) {
//     Navigator.pushNamed(context, '/bookDetails', arguments: docs[index]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 20,
//         backgroundColor: Color.fromARGB(255, 82, 94, 255),
//         title: Text("Book List"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 192, 192),
//               Color.fromARGB(255, 145, 173, 255),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: ListView.builder(
//             itemCount: titles.length,
//             itemBuilder: (context, index) {
//               final cardColour = Color.fromARGB(153, 145, 216, 227);
//               final bookRating = docs[index]['rating'] ?? 4.0;

//               return Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 shadowColor: Colors.grey.withOpacity(0.5),
//                 elevation: 9,
//                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
//                 color: cardColour,
//                 child: Container(
//                   height: 114,
//                   width: 300,
//                   child: CustomPaint(
//                     painter: customCardPaint(
//                         24.0,
//                         Color.fromARGB(208, 128, 147, 204).withOpacity(0.4),
//                         Color.fromARGB(255, 180, 99, 99).withOpacity(0.7)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           RatingBar(rating: bookRating.toDouble()),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: const LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(255, 240, 245, 250),
//                                   Color.fromARGB(255, 121, 140, 173),
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Color.fromARGB(99, 0, 0, 0),
//                                   blurRadius: 12,
//                                   offset: Offset(0, 6),
//                                 ),
//                               ],
//                             ),
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundImage: NetworkImage(
//                                   'https://covers.openlibrary.org/b/id/${docs[index]['cover_i']}-L.jpg',
//                                 ),
//                                 radius: 30,
//                               ),
//                               title: Text(titles[index]),
//                               subtitle: Text(
//                                   docs[index]['author_name']?.first ??
//                                       'Unknown'),
//                               trailing: IconButton(
//                                 icon: Icon(Icons.delete_sweep),
//                                 onPressed: () {
//                                   deleteBook(index);
//                                 },
//                               ),
//                               onTap: () {
//                                 navigateToBookDetailsPage(titles[index], index);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//   import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:app_1/book_details.dart';
// import 'package:app_1/customCardPaint.dart';
// import 'package:app_1/rating_bar.dart';
// import 'dart:async';
// import 'package:app_1/book_search.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomepage(),
//       routes: {
//         '/bookDetails': (context) => BookDetailsPage(),
//       },
//     );
//   }
// }

// class MyHomepage extends StatefulWidget {
//   @override
//   _MyHomepageState createState() => _MyHomepageState();
// }

// class _MyHomepageState extends State<MyHomepage> {
//   List<String> titles = [];
//   List<dynamic> docs = [];
//   Timer? _debounceTimer;

//   Future<List<String>> fetchTitles(query) async {
//     final response = await http
//         .get(Uri.parse("https://openlibrary.org/search.json?q=$query"));
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
//       docs = jsonResponse['docs'];

//       setState(() {
//         titles = docs.map((doc) => doc['title']).toList().cast<String>();
//       });
//     }
//     return titles;
//   }

//   @override
//   void initState() {
//     // fetchTitles();
//     super.initState();
//   }

//   // void navigateToBookDetailsPage(String bookTitle, int index) {
//   //   Navigator.pushNamed(context, '/bookDetails', arguments: docs[index]);
//   // }

//   void searchBooks(String query) {
//     if (_debounceTimer != null && _debounceTimer!.isActive) {
//       _debounceTimer!.cancel();
//     }

//     _debounceTimer = Timer(const Duration(milliseconds: 800), () {
//       fetchTitles(query);
//     });
//   }

//   @override
//   void dispose() {
//     _debounceTimer?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 20,
//         backgroundColor: Color.fromARGB(255, 82, 94, 255),
//         actions: [
//           IconButton(
//               icon:const Icon(Icons.search),
//               onPressed: () {
//                 showSearch(context: context, delegate: BookSearch());
//               }),
//         ],
//         title: const Text("Book List"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 255, 192, 192),
//               Color.fromARGB(255, 145, 173, 255),
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Center(
//           child: ListView.builder(
//             itemCount: titles.length,
//             itemBuilder: (context, index) {
//               final cardColour = Color.fromARGB(153, 145, 216, 227);
//               final bookRating = docs[index]['rating'] ?? 4.0;

//               return Card(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 shadowColor: Colors.grey.withOpacity(0.5),
//                 elevation: 9,
//                 margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
//                 color: cardColour,
//                 child: Container(
//                   height: 114,
//                   width: 300,
//                   child: CustomPaint(
//                     painter: customCardPaint(
//                         24.0,
//                         Color.fromARGB(208, 128, 147, 204).withOpacity(0.4),
//                         Color.fromARGB(255, 180, 99, 99).withOpacity(0.7)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           RatingBar(rating: bookRating.toDouble()),
//                           const SizedBox(
//                             height: 8,
//                           ),
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               gradient: const LinearGradient(
//                                 colors: [
//                                   Color.fromARGB(255, 240, 245, 250),
//                                   Color.fromARGB(255, 121, 140, 173),
//                                 ],
//                                 begin: Alignment.topLeft,
//                                 end: Alignment.bottomRight,
//                               ),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: Color.fromARGB(99, 0, 0, 0),
//                                   blurRadius: 12,
//                                   offset: Offset(0, 6),
//                                 ),
//                               ],
//                             ),
//                             child: ListTile(
//                               leading: CircleAvatar(
//                                 backgroundImage: NetworkImage(
//                                   'https://covers.openlibrary.org/b/id/${docs[index]['cover_i']}-L.jpg',
//                                 ),
//                                 radius: 30,
//                               ),
//                               title: Text(titles[index]),
//                               subtitle: Text(
//                                   docs[index]['author_name']?.first ??
//                                       'Unknown'),
//                               onTap: () {
//                                 // navigateToBookDetailsPage(titles[index], index);
//                                 Navigator.pushNamed(context, '/bookDetails', arguments: docs[index]);
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:app_1/reUsable_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:app_1/book_details.dart';
import 'dart:async';
import 'package:app_1/book_search.dart';

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
  Timer? _debounceTimer;

  Future<List<String>> fetchTitles(query) async {
    final response = await http
        .get(Uri.parse("https://openlibrary.org/search.json?q=Flutter"));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      docs = jsonResponse['docs'];

      setState(() {
        titles = docs.map((doc) => doc['title']).toList().cast<String>();
      });
    }
    return titles;
  }

  @override
  void initState() {
    fetchTitles(titles);
    super.initState();
  }

  void navigateToBookDetailsPage(String bookTitle, int index) {
    Navigator.pushNamed(context, '/bookDetails', arguments: docs[index]);
  }

  void searchBooks(String query) {
    if (_debounceTimer != null && _debounceTimer!.isActive) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 800), () {
      fetchTitles(query);
    });
  }



  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        backgroundColor: Color.fromARGB(255, 82, 94, 255),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // modification done just now passed values
                showSearch(context: context, delegate: BookSearch(docs:docs));
              }),
        ],
        title: const Text("Book List"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 192, 192),
              Color.fromARGB(255, 145, 173, 255),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              final cardColour = Color.fromARGB(153, 145, 216, 227);
              final bookRating = docs[index]['rating'] ?? 4.0;
              return reUseCard(cardColour, bookRating, titles, docs, index, context);
            },
          ),
        ),
      ),
    );
  }
}
