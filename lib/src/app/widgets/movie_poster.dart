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
    switch (posterType) {
      case MoviePosterSize.small:
        return _SmallPoster(
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
