import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/app/features/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/widgets/information_container.dart';
import 'package:movies/src/app/widgets/movie_poster.dart';


class PosterDetailPage extends StatelessWidget {
  const PosterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title:  Text(
          "Popular",
          style: TextStyle(color: whiteColor),
        ),
        backgroundColor: blackColor,
        elevation: 0,
        centerTitle: false,
      ),
      body: BlocBuilder<TvShowBloc, TvShowState>(builder: (context, state) {
        final list = state.lists?[TvShowListType.popular] ?? [];

        if (list.isEmpty) {
          return const InformationContainer(
            icon: Icons.bar_chart_rounded,
            message: 'Error showing data',
          );
        }

        return Center(
          child: SingleChildScrollView(
            child: CarouselSlider.builder(
              itemCount: list.length,
              options: CarouselOptions(
                aspectRatio: 3.0,
                enlargeCenterPage: true,
                autoPlay: false,
                height: MediaQuery.of(context).size.height * 0.8,
              ),
              itemBuilder: (ctx, index, realIdx) {
                return MoviePoster(
                  posterType: MoviePosterSize.big,
                  tvShow: list[index],
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
