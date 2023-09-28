import 'package:bookly_app/core/widgets/Circular_indicator.dart';
import 'package:bookly_app/features/Home/presention/manager/NewestBooksCubit/bloc.dart';
import 'package:bookly_app/features/Home/presention/manager/NewestBooksCubit/state.dart';
import 'package:bookly_app/features/Home/presention/view/widgets/HomeListVerticalItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'as bloc;
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../BookDetailsView.dart';

class HomeListViewVertical extends StatelessWidget {
  const HomeListViewVertical({super.key});

  @override
  Widget build(BuildContext context) {
        return bloc.BlocBuilder<NewestBooksCubit,NewestBooksState>(
          builder: (context, state) {
            if(state is SuccessNewestBooksState ){
          return ListView.builder(
                padding: EdgeInsets.zero,
                physics:const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) =>InkWell(
                    onTap: () {
                      Get.to(()=> BookDetailsView(model:bloc.BlocProvider.of<NewestBooksCubit>(context).Books[index],
                        books:bloc.BlocProvider.of<NewestBooksCubit>(context).Books , ),
                          transition: Transition.fade,duration: KTranscationDuration);
                    },
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: HomeVerticalItem(model:
                          bloc.BlocProvider.of<NewestBooksCubit>(context).Books[index]),
                    )),
                itemCount:  bloc.BlocProvider.of<NewestBooksCubit>(context).Books.length);}
            else if(state is ErrorNewestBooksState){
              return ErrorWidget(state.errMessage);
            }
            else{
              return const CircularIndicator();
            }
          },
        );
  }
}
