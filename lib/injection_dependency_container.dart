import 'package:get_it/get_it.dart';
import 'package:movies/src/app/features/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies/src/app/features/tv_show/data/datasources/tv_show_remote_data_source.dart';
import 'package:movies/src/app/features/tv_show/data/repositories/tv_show_repository_impl.dart';
import 'package:movies/src/app/utils/failure_to_message.dart';
import 'package:movies/src/app/utils/url_path_converter.dart';
import 'package:movies/src/domain/repositories/tv_show_repository.dart';
import 'package:movies/src/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:movies/src/domain/usecases/get_popular_tv_shows.dart';
import 'package:http/http.dart' as http;
import 'package:movies/src/domain/usecases/get_recommended_tv_shows.dart';
final sl = GetIt.instance;

Future<void> init() async {
  //! Features - TvShow
  //? Bloc
  sl.registerLazySingleton(
    () => TvShowBloc(
      getPopularTvShows: sl(),
      getAiringTodayTvShows: sl(),
      message: sl(),
      getRecommendedTvShows: sl(),
    ),
  );

  //? UseCases
  sl.registerLazySingleton(() => GetPopularTvShow(sl()));
  sl.registerLazySingleton(() => GetRecommendedTvShow(sl()));
  sl.registerLazySingleton(() => GetAiringTodayTvShows(sl()));
  //? Repository
  sl.registerLazySingleton<TvShowRepository>(
    () => TvShowRepositoryImpl(
      remoteDataSource: sl(),
    ),
  );

  //? Data Sources
  sl.registerLazySingleton<TvShowRemoteDataSource>(
    () => TvShowRemoteDataSourceImpl(
      client: sl(),
      urlPathConverter: sl(),
    ),
  );

  //! Core
  sl.registerLazySingleton(() => UrlPathConverter());
  sl.registerLazySingleton(() => Message());


  sl.registerLazySingleton(() => http.Client());
}
