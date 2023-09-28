import 'package:bookly_app/features/Home/data/repo/home_repo.dart';
import 'package:bookly_app/features/Home/presention/manager/FeatureBooksCubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/BookModel.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(initialFeatureBooksState());

  HomeRepo homeRepo;
  late List<Items> Books;
  Future<void> FetchFeatuereBooks() async {
    emit(LoadingFeatureBooksState());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(ErrorFeatureBooksState(failure.errMessage));
    }, (books) {
      Books = books;
      emit(SuccessFeatureBooksState());
    });
  }
  @override
  void onChange(Change<FeatureBooksState> change) {

    super.onChange(change);
    print(change);
  }
}
