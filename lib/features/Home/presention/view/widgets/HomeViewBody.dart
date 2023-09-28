
import 'package:bookly_app/features/Home/presention/view/widgets/HomeListViewVertical.dart';
import 'package:bookly_app/features/Home/presention/view/widgets/HomeViewListViewHorizntal.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilites/Styles.dart';


class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeViewListViewHorizntal(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "New Books",
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

        SliverFillRemaining(
          child: HomeListViewVertical(),
        ),

      ],
    );
  }
}
