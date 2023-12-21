part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.isLoading = false,
    this.popularTvsList = const [],
    this.popularMoviesList = const [],
  });

  final bool isLoading;
  final List<TvModel> popularTvsList;
  final List<MovieModel> popularMoviesList;

  @override
  List<Object> get props => [isLoading, popularTvsList, popularMoviesList];

  HomeState copyWith({bool? isLoading, List<TvModel>? popularTvsList, List<MovieModel>? popularMoviesList}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      popularTvsList: popularTvsList ?? this.popularTvsList,
      popularMoviesList: popularMoviesList ?? this.popularMoviesList,
    );
  }
}
