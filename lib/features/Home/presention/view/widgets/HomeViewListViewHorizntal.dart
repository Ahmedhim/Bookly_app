import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/widgets/Circular_indicator.dart';
import 'package:bookly_app/features/Home/presention/manager/FeatureBooksCubit/bloc.dart';
import 'package:bookly_app/features/Home/presention/manager/FeatureBooksCubit/state.dart';
import 'package:bookly_app/features/Home/presention/view/BookDetailsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:get/get.dart';
import 'HomeViewItem.dart';

class HomeViewListViewHorizntal extends StatelessWidget {
  const HomeViewListViewHorizntal({super.key});

  @override
  Widget build(BuildContext context) {
    return bloc.BlocBuilder<FeatureBooksCubit,FeatureBooksState>(
          builder: (context, state) {
            if(state is SuccessFeatureBooksState && bloc.BlocProvider.of<FeatureBooksCubit>(context).Books.isNotEmpty){
            return SizedBox(
                height:MediaQuery.sizeOf(context).height *.3,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder:(context, index) =>  const SizedBox(width: 10),
                  itemBuilder: (context, index) => InkWell(onTap: () {
                    Get.to(()=> BookDetailsView(model: bloc.BlocProvider.of<FeatureBooksCubit>(context).Books[index],
                        books: bloc.BlocProvider.of<FeatureBooksCubit>(context).Books)
                        ,transition: Transition.fade ,
                        duration: KTranscationDuration);
                  },
                      child:  HomeHorzItem(imageUrl: bloc.BlocProvider.of<FeatureBooksCubit>(context).Books[index].volumeInfo!.imageLinks!.thumbnail!,)),
                  itemCount:bloc.BlocProvider.of<FeatureBooksCubit>(context).Books.length,
                  scrollDirection: Axis.horizontal,
                )
            );}
            else if(state is ErrorFeatureBooksState){
              return ErrorWidget(state.errMessage);
            }
            else{
              return const CircularIndicator();
            }
          },
        );



  }
}
