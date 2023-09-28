import 'package:bookly_app/features/Home/data/repo/home_repo.dart';
import 'package:bookly_app/features/Home/presention/manager/NewestBooksCubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/BookModel.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(initialNewestBooksState());

  HomeRepo homeRepo;
  late List<Items> Books;
  Future<void> FetchNewestBooks() async {
    emit(LoadingNewestBooksState());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(ErrorNewestBooksState(failure.errMessage));
    }, (books) {
      Books = books;
      emit(SuccessNewestBooksState());
    });
  }
  @override
  void onChange(Change<NewestBooksState> change) {

    super.onChange(change);
    print(change);
  }
}
