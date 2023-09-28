abstract class FeatureBooksState{}
class initialFeatureBooksState extends FeatureBooksState{}
class LoadingFeatureBooksState extends FeatureBooksState{}
class SuccessFeatureBooksState extends FeatureBooksState{}
class ErrorFeatureBooksState extends FeatureBooksState{

  final String errMessage;

  ErrorFeatureBooksState(this.errMessage);
}