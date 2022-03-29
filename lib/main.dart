import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_movies/layouts/layouts.dart';
import 'package:free_movies/shared/cubit/app_cubit.dart';
import 'package:free_movies/shared/cubit/app_states.dart';
import 'package:free_movies/shared/cubit/bloc_observer.dart';
import 'package:free_movies/shared/network/dio.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getMovies(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: splashScreen(context),
          );
        },
      ),
    );
  }
}
