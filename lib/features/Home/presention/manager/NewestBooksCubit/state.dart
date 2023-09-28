abstract class NewestBooksState{}
class initialNewestBooksState extends NewestBooksState{}
class LoadingNewestBooksState extends NewestBooksState{}
class SuccessNewestBooksState extends NewestBooksState{}
class ErrorNewestBooksState extends NewestBooksState{

  final String errMessage;

  ErrorNewestBooksState(this.errMessage);
}