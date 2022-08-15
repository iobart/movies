import 'package:dartz/dartz.dart';
import 'package:movies/src/domain/entities/tv_show.dart';
import 'package:movies/src/domain/repositories/tv_show_repository.dart';
import 'package:movies/src/error/failures.dart';
import 'package:movies/src/usecases/usecase.dart';
class GetAiringTodayTvShows extends UseCase<List<TvShow>, NoParams> {
  /// Repository to handle the method implementations of the usecase.
  final TvShowRepository tvShowRepository;

  GetAiringTodayTvShows(this.tvShowRepository);

  @override
  Future<Either<Failure, List<TvShow>>> call(NoParams params) async {
    return await tvShowRepository.getAiringTodayTvShows();
  }
}
