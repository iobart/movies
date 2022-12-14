import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/utils/modify_text_length.dart';
import 'package:movies/src/app/utils/set_stars.dart';
import 'package:movies/src/domain/entities/tv_show.dart';
import 'movies_action_button.dart';
import 'movies_button.dart';
import 'movies_image.dart';

/// Enum with Movie Poster sizes.
enum MoviePosterSize {
  small,
  normal,
  big,
}

class MoviePoster extends StatelessWidget {
  final MoviePosterSize posterType;
  final TvShow tvShow;

  const MoviePoster({
    Key? key,
    required this.tvShow,
    this.posterType = MoviePosterSize.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onWatchNow() {
      Navigator.pushNamed(context, '/detailRecent');
    }

    switch (posterType) {
      case MoviePosterSize.small:
        return _SmallPoster(
          tvShow: tvShow,
        );
      case MoviePosterSize.normal:
        return _NormalPoster(
          onWatchNow: _onWatchNow,
          tvShow: tvShow,
        );
      case MoviePosterSize.big:
        return _BigPoster(
          onWatchNow: _onWatchNow,
          tvShow: tvShow,
        );
      default:
        return _SmallPoster(
          tvShow: tvShow,
        );
    }
  }
}

class _SmallPoster extends StatelessWidget {
  final TvShow tvShow;

  const _SmallPoster({
    Key? key,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesImage(
            width: 150,
            height: 200,
            imagePath: tvShow.posterPath,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            tvShow.name,
            style:  TextStyle(
              color: whiteColor,
              fontSize: 16,
              decoration: TextDecoration.none,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _PosterStars(
            rating: double.parse(tvShow.voteAverage.toString()),
          )
        ],
      ),
    );
  }
}

class _NormalPoster extends StatelessWidget {
  final void Function() onWatchNow;
  final TvShow tvShow;

  const _NormalPoster({
    Key? key,
    required this.onWatchNow,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onFavorite() {}

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesImage(
            width: 130,
            height: 150,
            imagePath: tvShow.posterPath,
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subStringTextLength(25, tvShow.name),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "IMDb: ${tvShow.voteAverage}",
                    style:  TextStyle(
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                ),
                _PosterStars(rating: double.parse(tvShow.voteAverage.toString())),
                Row(
                  children: [
                    MoviesButton(
                      text: "Watch Now",
                      onPressed: onWatchNow,
                      width: 120,
                      hasMargin: false,
                    ),
                    MoviesActionButton(
                      icon: Icons.favorite_outline_rounded,
                      function: _onFavorite,
                      iconColor: greyColor,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BigPoster extends StatelessWidget {
  final void Function() onWatchNow;
  final TvShow tvShow;

  const _BigPoster({
    Key? key,
    required this.onWatchNow,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesImage(
            width: 290,
            height: 320,
            imagePath: tvShow.posterPath,
          ),
          const SizedBox(
            height: 4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  tvShow.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  "IMDb: ${tvShow.voteAverage}",
                  style:  TextStyle(
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
              ),
              _PosterStars(rating: double.parse(tvShow.voteAverage.toString()), centered: true),
              MoviesButton(
                text: "Watch Now",
                onPressed: onWatchNow,
                width: 120,
                hasMargin: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PosterStars extends StatelessWidget {
  final double rating;
  final bool centered;

  const _PosterStars({
    Key? key,
    required this.rating,
    this.centered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          ...setStarIconByRating(rating)
              .map((iconType) => Icon(
                    iconType,
                    size: 15,
                    color: greyColor,
                  ))
              .toList()
        ],
      ),
    );
  }
}
