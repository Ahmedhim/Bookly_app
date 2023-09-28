
import 'package:bookly_app/features/Home/data/models/BookModel.dart';
import 'package:bookly_app/features/Home/presention/view/widgets/BookDetailsList.dart';
import 'package:bookly_app/features/Home/presention/view/widgets/BookDetailsRating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilites/Styles.dart';
import 'BookDetailsButtom.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.model, required this.books});
final Items model;
final List<Items>books;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                SizedBox(height: 300,
                child: CachedNetworkImage(imageUrl:model.volumeInfo?.imageLinks?.thumbnail??"null",fit: BoxFit.fitHeight,
                  errorWidget: (context, url, error) => const Icon(Icons.error), )
             ),
               Text(model.volumeInfo?.title??"null",style: Styles.textStyle30,
                textAlign: TextAlign.center,),
              Text(model.volumeInfo?.publisher??"null",style: Styles.textStyle18.
              copyWith(color: Colors.grey,fontWeight: FontWeight.w500),
                textAlign:TextAlign.center ,),
              const SizedBox(height: 14),
               BookDetailsRating(model: model),
              const SizedBox(height: 37,),
                BookDetailsButtom(model: model),
              const SizedBox(height: 49),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("You can also like",style:
                Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),),
              ),


            ],
          ),
        ),
      const SliverToBoxAdapter(
         child: SizedBox(height:16 ,),
       ),
        SliverToBoxAdapter(
          child: BookDetailsList(books: books),
        )

      ],
    );

  }
}


