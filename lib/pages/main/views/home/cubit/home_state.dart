part of 'home_cubit.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.isLoading = false,
    this.movies = const [],
  });

  final bool isLoading;
  final List<MovieModel> movies;

  @override
  List<Object> get props => [isLoading, movies];

  HomeState copyWith({bool? isLoading, List<MovieModel>? movies}) {
    return HomeState(
      movies: movies ?? this.movies,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
