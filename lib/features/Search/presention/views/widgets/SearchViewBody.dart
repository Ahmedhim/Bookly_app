import 'package:bookly_app/features/Search/presention/views/widgets/SearchViewList.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilites/Styles.dart';


class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Search Result",
            style: Styles.textStyle18,
          ),
        ),
        SizedBox(height: 14,),
        Expanded(child: SearchViewList()),

      ],
    );
  }
}
