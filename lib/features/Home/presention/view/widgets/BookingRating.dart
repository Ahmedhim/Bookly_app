
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../../../../core/utilites/Styles.dart';
import '../../../data/models/BookModel.dart';


Widget BookingRating(Items model)=>Row(
  children: [
    const Icon(
      FontAwesomeIcons.solidStar,
      color: Colors.yellow,
      size: 16,
    ),
    const SizedBox(width: 3,),
    const Text("0", style: Styles.textStyle16),
    const SizedBox(width: 9,),
    Text("(${model.volumeInfo!.pageCount??"null"})", style: Styles.textStyle14.copyWith(color: Colors.grey)),
  ],
);