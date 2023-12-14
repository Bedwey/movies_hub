import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  final int id;
  final String title;
  final String poster;
  final String backdrop;

  const MovieModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.backdrop,
  });

  @override
  List<Object> get props => [title, poster, backdrop];

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int,
      title: map['title'] as String,
      poster: map['poster_path'] as String,
      backdrop: map['backdrop_path'] as String,
    );
  }
}
