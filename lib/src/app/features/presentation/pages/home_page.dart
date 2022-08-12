import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/app/features/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies/src/app/widgets/information_container.dart';
import 'package:movies/src/app/widgets/movie_list.dart';
import 'package:movies/src/app/widgets/movie_poster.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (BuildContext context, state) {
          if (!state.hasData) {
            return const InformationContainer(
              icon: Icons.error_outline_rounded,
              message: "Something went wrong",
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                MovieList(
                    listTitle: "Popular", tvShows: state.lists?[TvShowListType.popular] ?? []),
                MovieList(
                  listTitle: "Recommended",
                  posterType: MoviePosterSize.normal,
                  tvShows: state.lists?[TvShowListType.recommended] ?? [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
