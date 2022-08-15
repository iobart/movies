import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/src/app/features/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies/src/app/widgets/information_container.dart';
import 'package:movies/src/app/widgets/list_separator.dart';
import 'package:movies/src/app/widgets/movie_view.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (BuildContext context, state) {
          final list = state.lists?[TvShowListType.popular] ?? [];

          if (list.isEmpty) {
            return const InformationContainer(
              icon: Icons.link_off_rounded,
              message: "Something went wrong",
            );
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieView(
                  tvShow: list[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const ListSeparator(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}
