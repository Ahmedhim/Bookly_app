
import 'package:bookly_app/features/Home/presention/view/widgets/HomeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants.dart';
import '../../../../core/utilites/AssetsData.dart';
import '../../../Search/presention/views/SearchView.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
        return WillPopScope(
          onWillPop: ()async => false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: const Image(image: AssetImage(AssetsData.KprimaryImage),height: 100,width: 100),
              actions: [
                IconButton(onPressed: () {
                  Get.to(()=>const SearchView(),transition: Transition.zoom,
                      duration: KTranscationDuration);
                },
                  icon:const Icon(Icons.search),)
              ],
            ),
            body:const HomeViewBody(),
          ),
        );

}}
