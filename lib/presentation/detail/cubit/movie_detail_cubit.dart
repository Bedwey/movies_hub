import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../locator.dart';
import '../../../models/movie.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(this.movieId) : super(const MovieDetailState()) {
    loadData();
  }

  final int movieId;

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      var response = await locator<TMDB>().v3.movies.getSimilar(movieId);
      log(response.toString());

      List<MovieModel> movies = (response['results'] as List).map((map) => MovieModel.fromMap(map)).toList();
      emit(state.copyWith(simularMoviesList: movies));
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  void toggleFavorite() {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }
}
