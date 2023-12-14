import 'package:flutter/material.dart';
import 'package:movies_hub/models/movie.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: movie.id,
            child: Image(
              image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.poster}'),
            ),
          ),
        ],
      ),
    );
  }
}
