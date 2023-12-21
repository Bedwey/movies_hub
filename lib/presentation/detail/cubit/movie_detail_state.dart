part of 'movie_detail_cubit.dart';

class MovieDetailState extends Equatable {
  const MovieDetailState({
    this.isLoading = false,
    this.isFavorite = false,
    this.simularMoviesList = const [],
  });

  final bool isLoading;
  final bool isFavorite;
  final List<MovieModel> simularMoviesList;

  @override
  List<Object> get props => [isLoading, isFavorite, simularMoviesList];

  MovieDetailState copyWith({bool? isLoading, bool? isFavorite, List<MovieModel>? simularMoviesList}) {
    return MovieDetailState(
      isLoading: isLoading ?? this.isLoading,
      isFavorite: isFavorite ?? this.isFavorite,
      simularMoviesList: simularMoviesList ?? this.simularMoviesList,
    );
  }
}
