
import 'package:bookly_app/features/Home/presention/view/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilites/AssetsData.dart';
import 'SlidingText.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;
  @override
  void initState() {
    //
    super.initState();
    initSlidingAnimation();
    GetNavagitorToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
 const Image(image: AssetImage(AssetsData.KprimaryImage),),
  const SizedBox(height: 4,),

 SlidingText(slidinganimation: slidinganimation),

],
    );

  }
  void initSlidingAnimation() {
    animationController=AnimationController(vsync: this,duration: const Duration(seconds: 1),);
    slidinganimation=Tween<Offset>(begin:const Offset(0,2) ,end:Offset.zero ).animate(animationController);
    animationController.forward();
  }
  void GetNavagitorToHomeView() {
    Future.delayed(const Duration(seconds: 2),() {
      Get.to( ()=>const HomeView(),transition: Transition.fade,duration: KTranscationDuration);
    },);
  }

}


