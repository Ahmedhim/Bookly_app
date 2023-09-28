
import 'package:bookly_app/core/utilites/api_servives.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../models/BookModel.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<Items>>> fetchNewsetBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=newest &q=games');
      List<Items> books = [];
      for (var item in data['items']) {
        try {
          books.add(Items.fromJson(item));
        } catch (e) {
          books.add(Items.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Items>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:games');
      List<Items> books = [];
      for (var item in data['items']) {
        books.add(Items.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Items>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming');
      List<Items> books = [];
      for (var item in data['items']) {
        books.add(Items.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
