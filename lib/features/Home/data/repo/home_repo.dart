

import 'package:bookly_app/features/Home/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Items>>> fetchNewsetBooks();
  Future<Either<Failure, List<Items>>> fetchFeaturedBooks();
  Future<Either<Failure, List<Items>>> fetchSimilarBooks(
      {required String category});
}
