import 'package:bookly_app/core/utilites/api_servives.dart';
import 'package:bookly_app/features/Home/data/repo/home_repo_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void SetupServiceLoacter(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
}
