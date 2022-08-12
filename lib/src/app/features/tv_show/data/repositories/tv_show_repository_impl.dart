import 'package:dartz/dartz.dart';
import 'package:movies/src/app/features/tv_show/data/datasources/tv_show_remote_data_source.dart';
import 'package:movies/src/domain/entities/tv_show.dart';
import 'package:movies/src/domain/repositories/tv_show_repository.dart';
import 'package:movies/src/error/exceptions.dart';
import 'package:movies/src/error/failures.dart';



/// Alias for a Future of a List of TvShows.
typedef _TvShowsList = Future<List<TvShow>> Function();

class TvShowRepositoryImpl extends TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;

  TvShowRepositoryImpl({required this.remoteDataSource});



  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows() async {
    return await _getTvShows(() => remoteDataSource.getPopularTvShows());
  }


  /// Get a list of TvShows depends on the remote method
  Future<Either<Failure, List<TvShow>>> _getTvShows(_TvShowsList function) async {
    try {
      final result = await function();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

}
