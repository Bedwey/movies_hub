import 'package:equatable/equatable.dart';

class TvModel extends Equatable {
  final int id;
  final String name;
  final String? overview;
  final String poster;
  final double? popularity;
  final String releaseDate;

  const TvModel({
    required this.id,
    required this.name,
    this.overview,
    required this.poster,
    required this.popularity,
    required this.releaseDate,
  });

  factory TvModel.fromMap(Map<String, dynamic> map) {
    return TvModel(
      id: map['id'] as int,
      name: map['name'] as String,
      overview: map['overview'] as String?,
      poster: map['poster_path'] != null ? 'https://image.tmdb.org/t/p/w342/${map['poster_path']}' : 'https://placehold.co/200x300.jpg?text=${map['name']}',
      popularity: map['popularity'] as double?,
      releaseDate: map['releaseDate'] as String? ?? 'Unknown',
    );
  }

  @override
  List<Object?> get props => [id, name, overview, poster];
}
