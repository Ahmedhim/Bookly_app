import 'package:bookly_app/features/Home/data/repo/home_repo_imp.dart';
import 'package:bookly_app/features/Home/presention/manager/FeatureBooksCubit/bloc.dart';
import 'package:bookly_app/features/Home/presention/manager/NewestBooksCubit/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'core/utilites/services_loacater.dart';
import 'features/Splash/presentation/views/SplashView.dart';

void main() {
  SetupServiceLoacter();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider (
          create:(context) {
            return  FeatureBooksCubit(getIt.get<HomeRepoImpl>())..FetchFeatuereBooks();
          },
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(getIt.get<HomeRepoImpl>())..FetchNewestBooks(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        home: const SplashView(),
      ),
    );
  }
}
