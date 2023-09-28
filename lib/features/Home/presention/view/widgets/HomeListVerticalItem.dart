import 'package:bookly_app/features/Home/data/models/BookModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utilites/Styles.dart';
import 'BookingRating.dart';

class HomeVerticalItem extends StatelessWidget {
  const HomeVerticalItem({super.key, required this.model});
final Items model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20,),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child:CachedNetworkImage(imageUrl: model.volumeInfo?.imageLinks?.thumbnail??"null",
            errorWidget: (context, url, error) => const Icon(Icons.error),
            height: 125,)
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .5,
                  child: Text(
                    model.volumeInfo!.title??"null",
                    style: Styles.textStyle20,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 2.5,
                ),
                Text(
                  model.volumeInfo!.publisher??"null",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyle14.copyWith(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height *.04),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * .6,
                    child: Row(
                      children: [
const Text("Free",style: Styles.textStyle16,),const Spacer(),
                        BookingRating(model)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

