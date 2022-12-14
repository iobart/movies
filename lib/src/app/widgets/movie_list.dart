import 'package:flutter/material.dart';
import 'package:movies/src/domain/entities/tv_show.dart';
import 'movie_detail_button.dart';
import 'movie_poster.dart';
import 'movies_title.dart';

class MovieList extends StatelessWidget {
  final String listTitle;
  final MoviePosterSize posterType;
  final List<TvShow> tvShows;

  const MovieList({
    Key? key,
    required this.listTitle,
    required this.tvShows,
    this.posterType = MoviePosterSize.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSeeAll() {
      Navigator.pushNamed(context, '/detailPoster');
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.only(bottom: 20),
      decoration:  const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MoviesTitle(
            text: listTitle,
          ),
          _ListOfMovies(
            posterType: posterType,
            list: tvShows,
          ),
          if (posterType == MoviePosterSize.small)
            MovieDetailButton(
              text: 'See All',
              onPressed: _onSeeAll,
            ),
        ],
      ),
    );
  }
}

class _ListOfMovies extends StatelessWidget {
  final MoviePosterSize posterType;
  final List<TvShow> list;

  const _ListOfMovies({
    Key? key,
    required this.posterType,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double posterHeight;

    switch (posterType) {
      case MoviePosterSize.small:
        posterHeight = 260;
        break;
      case MoviePosterSize.normal:
        posterHeight = 150;
        break;
      case MoviePosterSize.big:
        posterHeight = 480;
        break;
      default:
        posterHeight = 260;
        break;
    }

    return SizedBox(
      height: posterHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // Direction horizontal of the list
        itemCount: list.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (BuildContext context, int index) => MoviePoster(
          posterType: posterType,
          tvShow: list[index],
        ),
      ),
    );
  }
}
