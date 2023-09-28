import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class HomeHorzItem extends StatelessWidget {
  const HomeHorzItem({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 150,
      width: 150,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
      child:CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),
      )
    );
  }
}

