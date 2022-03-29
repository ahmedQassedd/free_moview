import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_movies/modules/details_screen/details_widgets.dart';
import 'package:free_movies/shared/cubit/app_cubit.dart';
import 'package:free_movies/shared/cubit/app_states.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen(this.index, {Key? key}) : super(key: key);
  late int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(context),
          body: movieDetails(
            context,
            cubit.moviesModel?.results?[index].title,
            cubit.moviesModel?.results?[index].releaseDate,
            cubit.moviesModel?.results?[index].voteAverage,
            cubit.moviesModel?.results?[index].voteCount,
            cubit.moviesModel?.results?[index].originalLanguage,
            cubit.moviesModel?.results?[index].popularity,
            cubit.moviesModel?.results?[index].posterPath,
            cubit.moviesModel?.results?[index].overview,
            cubit.moviesModel?.results?[index].id,
          ),
        );
      },
    );
  }
}
