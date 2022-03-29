import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_movies/models/movies_model.dart';
import 'package:free_movies/shared/cubit/app_states.dart';
import 'package:free_movies/shared/network/dio.dart';
import 'package:free_movies/shared/network/end_points.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);

  MoviesModel? moviesModel;

  void getMovies() {
    emit(LoadingGetMovies());
    DioHelper.getData(
      endPoint: movies,
      query: {'api_key': 'aa9715d820caa1acaf62b4e65f35722d'},
    ).then((value) {
      moviesModel = MoviesModel.json(value.data);
      emit(SuccessGetMovies());
    }).catchError((error) {
      print(error);
      emit(ErrorGetMovies());
    });
  }
}
