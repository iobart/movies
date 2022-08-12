import 'package:movies/src/error/failures.dart';
import 'package:movies/src/error/messages.dart';
class Message {
  /// This method is to handle the Failure type given by the usecases.
  ///
  /// So probably we can get a different message depending on the failure type.
  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return invalidDataFailureMessage;
      case CacheFailure:
        return cachedFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
