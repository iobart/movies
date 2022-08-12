import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/app/features/tv_show/data/models/tv_show_model.dart';
import 'package:movies/src/domain/entities/tv_show.dart';
import 'package:movies/src/domain/repositories/tv_show_repository.dart';
import 'package:movies/src/domain/usecases/get_popular_tv_shows.dart';
import 'package:movies/src/usecases/usecase.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {
  void main() {
    late GetPopularTvShow usecase;
    late MockTvShowRepository mockTvShowRepository;

    /// Test variable to ejemplify a new popular tv show list
    const testTvShowModel = TvShowModel(
      id: 1,
      name: "test",
      posterPath: "test",
      voteAverage: 1.0,
      firstAirDate: "2016-07-15",
      overview: "test",
    );
    const TvShow testTvShow = testTvShowModel;
    final testPopularTvShows = [testTvShow, testTvShow];
    setUp(() {
      mockTvShowRepository = MockTvShowRepository();
      usecase = GetPopularTvShow(mockTvShowRepository);
    });

    test('should get popular tv shows from the repository', () async {
      // arrange
      when(() => mockTvShowRepository.getPopularTvShows())
          .thenAnswer((_) async => Right(testPopularTvShows));
      // act
      final result = await usecase(NoParams());
      // assert
      expect(result, Right(testPopularTvShows));
      verify(() => mockTvShowRepository.getPopularTvShows());
      verifyNoMoreInteractions(
          mockTvShowRepository); // No more interactions with repository
    });
  }
}
