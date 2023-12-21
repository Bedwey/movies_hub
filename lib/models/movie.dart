import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String? overview;
  final String poster;
  final String? backdrop;
  final double popularity;
  final String releaseDate;

  const MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.backdrop,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [id, title, overview, poster, backdrop, popularity, releaseDate];

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int,
      title: map['title'] as String,
      overview: map['overview'] as String?,
      poster: map['poster_path'] != null ? 'https://image.tmdb.org/t/p/w342/${map['poster_path']}' : 'https://placehold.co/200x300.jpg?text=${map['title']}',
      backdrop: map['backdrop_path'] as String?,
      popularity: map['popularity'] as double,
      releaseDate: map['release_date'] as String? ?? 'Null',
    );
  }
}
