
import 'package:bookly_app/features/Home/presention/manager/FeatureBooksCubit/bloc.dart';
import 'package:bookly_app/features/Home/presention/manager/FeatureBooksCubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'as bloc;
import 'package:get/get.dart';


import '../../../../../constants.dart';
import '../../../data/models/BookModel.dart';
import '../BookDetailsView.dart';
import 'BookDetailsListItem.dart';

class BookDetailsList extends StatelessWidget {
  const BookDetailsList({super.key, required this.books});
final List<Items>books;
  @override
  Widget build(BuildContext context) {
    return bloc.BlocBuilder<FeatureBooksCubit,FeatureBooksState>(
     builder: (context, state) {
       return   SizedBox(
       height:MediaQuery.sizeOf(context).height *.2,
       child: ListView.separated(
         physics: const BouncingScrollPhysics(),
       separatorBuilder: (context, index) => const SizedBox(width: 5),
       itemBuilder: (context, index) => InkWell(onTap: () {
        Get.to(()=> BookDetailsView(model:books[index],
          books: books, )
            ,transition: Transition.fade,duration: KTranscationDuration);
       },
       child:  BookDetailsListItem(imageUrl:books[index].volumeInfo?.imageLinks?.thumbnail??"null" ,)),
       itemCount: books.length,
       scrollDirection: Axis.horizontal,
       )
       );
     },
    );
  }
}
