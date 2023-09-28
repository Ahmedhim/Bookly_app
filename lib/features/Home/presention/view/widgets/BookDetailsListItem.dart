import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookDetailsListItem extends StatelessWidget {
  const BookDetailsListItem({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
      child:  CachedNetworkImage(imageUrl: imageUrl,height: 125,)
    );

  }
}
