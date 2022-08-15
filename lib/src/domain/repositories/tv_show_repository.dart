import 'package:dartz/dartz.dart';
import 'package:movies/src/domain/entities/tv_show.dart';
import 'package:movies/src/error/failures.dart';

/// Repository of methods to have usecases of TV Shows
abstract class TvShowRepository {
  /// Search for popular TV Shows.
  ///
  /// Gets a list of Tv shows that are popular.
  /// If there are no results, an failure is returned.
  Future<Either<Failure, List<TvShow>>> getPopularTvShows();

  /// Search for recommended TV Shows.
  ///
  /// Gets a list of Tv shows that are recommended.
  /// If there are no results, an failure is returned.
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows();


  /// Search for todays airing TV Shows.
  ///
  /// Gets a list of todays airing Tv shows.
  /// If there are no results, an failure is returned.
  Future<Either<Failure, List<TvShow>>> getAiringTodayTvShows();

}
