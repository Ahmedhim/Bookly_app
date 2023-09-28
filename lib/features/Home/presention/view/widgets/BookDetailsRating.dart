import 'package:bookly_app/features/Home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utilites/Styles.dart';



class BookDetailsRating extends StatelessWidget {
  const BookDetailsRating({super.key, required this.model});
final Items model;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
          size: 16,
        ),
        const SizedBox(width: 3,),
        const Text("2.2", style: Styles.textStyle16),
        const SizedBox(width: 9,),
        Text(model.volumeInfo?.pageCount?.toString()??"null", style: Styles.textStyle14.copyWith(color: Colors.grey)),
      ],
    );
  }
}
