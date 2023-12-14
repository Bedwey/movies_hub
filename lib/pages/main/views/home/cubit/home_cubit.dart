import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_hub/locator.dart';
import 'package:movies_hub/models/movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    loadData();
  }

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    List<MovieModel> moviesList = [];
    final apiData = await locator<TMDB>().v3.trending.getTrending(timeWindow: TimeWindow.week, mediaType: MediaType.movie);
    for (var movie in apiData['results']) {
      moviesList.add(MovieModel.fromMap(movie));
    }
    log(moviesList.length.toString());
    emit(state.copyWith(movies: moviesList, isLoading: false));
  }
}
