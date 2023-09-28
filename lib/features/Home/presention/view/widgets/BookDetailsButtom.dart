import 'package:bookly_app/features/Home/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utilites/Styles.dart';



class BookDetailsButtom extends StatelessWidget {
  const BookDetailsButtom({
    super.key, required this.model,
  });
final Items model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration:const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12))
          ),
          padding: const EdgeInsets.only(bottom: 10,top: 14,right: 54,left: 45),
          child: Text("Free",style:
          Styles.textStyle18.copyWith(fontWeight: FontWeight.bold,color: Colors.black),),
        ),
        InkWell(
          onTap: () async{
            Uri url=Uri.parse(model.volumeInfo!.previewLink!);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xffEF8262),
                borderRadius: BorderRadius.only(topRight: Radius.circular(12),bottomRight: Radius.circular(12))
            ),
            padding: const EdgeInsets.only(bottom: 12,top: 14,right:28.5 ,left: 31.5),
            child: Text("Free preview",style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),),
          ),
        ),
      ],
    );
  }
}