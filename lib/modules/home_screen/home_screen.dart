import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_movies/modules/home_screen/home_widgets.dart';
import 'package:free_movies/shared/cubit/app_cubit.dart';
import 'package:free_movies/shared/cubit/app_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(),
          body: moviesList(context),
        );
      },
    );
  }
}
