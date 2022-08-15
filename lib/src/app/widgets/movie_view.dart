import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/utils/image_path_generator.dart';
import 'package:movies/src/domain/entities/tv_show.dart';

import 'movie_detail_button.dart';
import 'movies_image.dart';

class MovieView extends StatelessWidget {
  final TvShow tvShow;

  const MovieView({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onGoToView() {
      Navigator.pushNamed(context, '/recent');
    }

    return SizedBox(
      child: Column(
        children: [
          MoviesImage(
            width: 320,
            height: 320,
            imagePath: tvShow.posterPath,
            imageSize: ImageSize.original,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              tvShow.name,
              style:  TextStyle(fontSize: 30, color: whiteColor, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "IMDb: ${tvShow.voteAverage}",
            style: TextStyle(fontSize: 15, color: greyColor, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: MovieDetailButton(text: "Go to view", onPressed: _onGoToView),
          )
        ],
      ),
    );
  }
}
