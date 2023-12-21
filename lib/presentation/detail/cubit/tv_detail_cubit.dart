import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_hub/models/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../locator.dart';

part 'tv_detail_state.dart';

class TvDetailCubit extends Cubit<TvDetailState> {
  TvDetailCubit(this.tvId) : super(const TvDetailState()) {
    loadData();
  }

  final int tvId;

  Future<void> loadData() async {
    emit(state.copyWith(isLoading: true));
    try {
      var response = await locator<TMDB>().v3.tv.getSimilar(tvId);
      log(response.toString());

      List<TvModel> tvs = (response['results'] as List).map((map) => TvModel.fromMap(map)).toList();
      emit(state.copyWith(simularTvsList: tvs));
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
