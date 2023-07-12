// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class BookDetailsPage extends StatelessWidget {
//   @override
//   // String mapLanguageCode(String languageCode) {
//   //   final locale = Locale(languageCode);
//   //   // final formatMessage = Intl.message('', locale: locale);
//   //   // return formatMessage;
//   // }

//   Widget build(BuildContext context) {
//     final Map bookDetails = ModalRoute.of(context)!.settings.arguments as Map;
//     final String thumbnailUrl =
//         'https://covers.openlibrary.org/b/id/${bookDetails['cover_i']}-L.jpg';
//     // final String bookTitle = bookDetails['title'];
//     // final String publishDate = bookDetails['publish_date'];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Book Details"),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color.fromARGB(255, 204, 206, 206),
//               Color.fromARGB(255, 149, 184, 201),
//               Color.fromARGB(255, 234, 194, 194),
//               Color.fromARGB(255, 255, 213, 213),
//             ],
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Color.fromARGB(255, 76, 22, 123),
//                     width: 8.0,
//                   ),
//                 ),

//                 child: Image.network(
//                   thumbnailUrl,
//                   width: 200,
//                   height: 250,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Text(
//                 "Title: ${bookDetails["title"]}",
//                 style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.italic),
//               ),
//               const SizedBox(height: 16),
//               // "Publish Date: ${bookDetails["publish_date"][0]}",
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                  const Text(
//                     "Publish Date ",
//                     style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
//                   ),
//                  const Icon(
//                     Icons.calendar_month_outlined,
//                     size: 18,
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                   SizedBox(width:5),
//                   Text(
//                     ":${bookDetails["publish_date"][0]}",
//                     style: const TextStyle(fontSize: 16,
//                     fontWeight: FontWeight.w600),
//                     )
//                 ],
//               ),

//               const SizedBox(height: 16),
//               Text(
//                 "Edition Key: ${bookDetails["edition_key"][0]}",
//                 style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 "Language: ${bookDetails["language"].join(", ")}",
//                 style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 16),
//                Text(
//                 "Publisher: ${bookDetails["publisher"][0]}",
//                 style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 "Author: ${bookDetails['author_name']}",
//                 style:
//                     const TextStyle(fontSize: 17, fontStyle: FontStyle.italic,fontWeight: FontWeight.w600),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class BookDetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final Map bookDetails = ModalRoute.of(context)!.settings.arguments as Map;
//     final String thumbnailUrl =
//         'https://covers.openlibrary.org/b/id/${bookDetails['cover_i']}-L.jpg';
//     // final String bookTitle = bookDetails['title'];
//     // final String publishDate = bookDetails['publish_date'];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Book Details"),
//       ),
//       body: Stack(
//         children: [
//           Image.network(
//             thumbnailUrl,
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.contain,
//           ),
//           Container(
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors:[
//                   Color.fromARGB(147, 139, 246, 219),
//                   Color.fromARGB(146, 150, 211, 241),
//                   Color.fromARGB(97, 127, 129, 245),
//                   Color.fromARGB(121, 214, 123, 141),
//                 ],
//                 begin: Alignment.bottomLeft,
//                 end: Alignment.topRight,
//               ),
//             ),
//             // color: Color.fromARGB(199, 180, 234, 245), // Set opacity color
//           ),
//           Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Title: ${bookDetails["title"]}",
//                       style: const TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     // "Publish Date: ${bookDetails["publish_date"][0]}",
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           "Publish Date ",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const Icon(
//                           Icons.calendar_month_outlined,
//                           size: 18,
//                           color: Color.fromARGB(255, 0, 0, 0),
//                         ),
//                         SizedBox(width: 5),
//                         Text(
//                           ":${bookDetails["publish_date"][0]}",
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       "Edition Key: ${bookDetails["edition_key"][0]}",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       "Language: ${bookDetails["language"].join(", ")}",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       "Publisher: ${bookDetails["publisher"][0]}",
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 16),
//                     Text(
//                       "Author: ${bookDetails['author_name']}",
//                       style: const TextStyle(
//                         fontSize: 17,
//                         fontStyle: FontStyle.italic,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map bookDetails = ModalRoute.of(context)!.settings.arguments as Map;
    final String thumbnailUrl =
        'https://covers.openlibrary.org/b/id/${bookDetails['cover_i']}-L.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 204, 206, 206),
              Color.fromARGB(255, 149, 184, 201),
              Color.fromARGB(255, 234, 194, 194),
              Color.fromARGB(255, 255, 213, 213),
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                shadowColor:
                    const Color.fromARGB(255, 10, 7, 7).withOpacity(0.9),
                elevation: 9,
                margin:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Container(
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(colors: [
                    Color.fromARGB(97, 100, 255, 219),
                    Color.fromARGB(131, 57, 96, 173),
                    Color.fromARGB(120, 255, 100, 100),
                  ])),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Title: ${bookDetails["title"]}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Publish Date",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  size: 18,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                const SizedBox(width: 9),
                                Text(
                                  ":  ${bookDetails["publish_date"][0]}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ])),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Edition Key: ${bookDetails["edition_key"][0]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          "Language: ${bookDetails["language"].join(", ")}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Publisher: ${bookDetails["publisher"][0]}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Author: ${bookDetails['author_name']}",
                          style: const TextStyle(
                            fontSize: 17,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Color.fromARGB(255, 76, 22, 123),
                  width: 8.0,
                )),
                child: Image.network(
                  thumbnailUrl,
                  width: 380,
                  height: 420,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
