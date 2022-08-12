import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/src/app/utils/failure_to_message.dart';
import 'package:movies/src/domain/usecases/get_popular_tv_shows.dart';
import 'package:movies/src/error/failures.dart';

import '../../../../../domain/entities/tv_show.dart';
import '../../../../../usecases/usecase.dart';

part 'tv_show_event.dart';
part 'tv_show_state.dart';

class TvShowBloc extends Bloc<TvShowEvent, TvShowState> {

  GetPopularTvShow getPopularTvShows;
  Message message;

  TvShowBloc({
    required this.getPopularTvShows,
    required this.message,
  }) : super(const TvShowState(hasData: false, loading: false, lists: {})) {
    on<TvShowGetListEvent>(_onGetListEvent);
    on<TvShowGetDetailEvent>(_onGetDetailsEvent);

    add(const TvShowGetListEvent(type: TvShowListType.popular));

  }

  void _onGetListEvent(TvShowGetListEvent event, Emitter<TvShowState> emit) async {
    emit(state.copyWith(hasData: false, loading: true));
    Either<Failure, List<TvShow>>? failureOrTvShows;

    switch (event.type) {
      case TvShowListType.popular:
        failureOrTvShows = (await getPopularTvShows(NoParams())) as Either<Failure, List<TvShow>>?;
        break;
      default:
        failureOrTvShows = Left(ServerFailure());
        break;
    }

    failureOrTvShows?.fold(
            (failure) => emit(
          state.copyWith(
            loading: false,
            error: message.mapFailureToMessage(failure),
          ),
        ),
            (list) => emit(_setNewMapListByType(event, list)));
  }

  void _onGetDetailsEvent(TvShowGetDetailEvent event, Emitter<TvShowState> emit) {}

  /// Method to add the new list of data to the state
  TvShowState _setNewMapListByType(TvShowGetListEvent event, List<TvShow> list) {
    var newMap = {
      ...state.lists!,
      event.type: list,
    };
    return state.copyWith(hasData: true, loading: false, lists: newMap);
  }
}
