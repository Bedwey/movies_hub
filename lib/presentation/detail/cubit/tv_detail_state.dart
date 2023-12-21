part of 'tv_detail_cubit.dart';

class TvDetailState extends Equatable {
  const TvDetailState({
    this.isLoading = false,
    this.isFavorite = false,
    this.simularTvsList = const [],
  });

  final bool isLoading;
  final bool isFavorite;
  final List<TvModel> simularTvsList;

  @override
  List<Object> get props => [isLoading, isFavorite, simularTvsList];

  TvDetailState copyWith({bool? isLoading, bool? isFavorite, List<TvModel>? simularTvsList}) {
    return TvDetailState(
      isLoading: isLoading ?? this.isLoading,
      isFavorite: isFavorite ?? this.isFavorite,
      simularTvsList: simularTvsList ?? this.simularTvsList,
    );
  }
}
