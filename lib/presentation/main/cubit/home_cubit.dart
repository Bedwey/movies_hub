import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_hub/core/cli/dependency_injection.dart';
import 'package:movies_hub/models/movie.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../models/tv.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    loadData();
  }

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      var popularMoviesResponse = await locator<TMDB>().v3.trending.getTrending(mediaType: MediaType.movie);
      var popularTvsResponse = await locator<TMDB>().v3.trending.getTrending(mediaType: MediaType.tv);

      log(popularMoviesResponse.toString());
      List<MovieModel> movies = (popularMoviesResponse['results'] as List).map((map) => MovieModel.fromMap(map)).toList();
      List<TvModel> tvs = (popularTvsResponse['results'] as List).map((map) => TvModel.fromMap(map)).toList();

      emit(state.copyWith(popularMoviesList: movies, popularTvsList: tvs));
    } catch (e) {
      log(e.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}
