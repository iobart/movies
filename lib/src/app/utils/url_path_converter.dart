
import 'package:movies/src/error/failures.dart';

/// Class to convert data into a URI path.
class UrlPathConverter {
  static const baseUrl = "api.themoviedb.org"; // TODO: add to a environment variables file
  static const basePath = "/3/tv"; // TODO: add to a add to a environment variables file
  static const baseQueryParams = {
    "api_key": "1e3511856589abcb810cf090d8dc66ce",
    "language": "en-US",
    "page": "1",
  }; // TODO: add to a environment variables file

  /// Convert url path to a URI.
  ///
  /// Return a valid URI if we pass an [urlPath] to converted it with query params and base url data.
  /// Return a Failure of something wrong parsing the URI.
  Uri convertDataToUriPath(String urlPath) {
    try {
      final Uri uriResponse = Uri.https(baseUrl, "$basePath/$urlPath", baseQueryParams);
      return uriResponse;
    } catch (e) {
      throw InvalidUriFailure();
    }
  }
}

/// Class to handle failure parsing data to an URI path
class InvalidUriFailure extends Failure {
  @override
  List<Object?> get props => [];
}
