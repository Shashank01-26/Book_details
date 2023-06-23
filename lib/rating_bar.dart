// import 'package:flutter/widgets.dart';

// class RatingBar extends StatelessWidget {
//   final double rating;

//   const RatingBar(this.rating, {Key? key}):super(key:key);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(rating.floor(),(index)){
//         return Icon(
//           Icons.star,
//           color:Colors.gold,
//           size:16,
//         );
//       }
//     );
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({required this.rating,super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(rating.floor(), (index) {
        return const Icon(
          Icons.star,
          color: Colors.amberAccent,
          size: 16,
          
        );
      }),
    );
  }
}
