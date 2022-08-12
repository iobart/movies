import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies/src/app/features/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies/src/app/utils/failure_to_message.dart';
import 'package:movies/src/domain/usecases/get_popular_tv_shows.dart';


class MockGetPopularTvShows extends Mock implements GetPopularTvShow {}



class MockMessage extends Mock implements Message {}

void main() {
  late TvShowBloc bloc;

  late MockGetPopularTvShows mockGetPopularTvShows;

  late MockMessage mockMessage;

  setUp(() {

    mockGetPopularTvShows = MockGetPopularTvShows();

    mockMessage = MockMessage();

    bloc = TvShowBloc(
      getPopularTvShows: mockGetPopularTvShows,
      message: mockMessage,
    );
  });
}
