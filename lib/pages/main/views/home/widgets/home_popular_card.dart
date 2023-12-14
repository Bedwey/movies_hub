import 'package:flutter/material.dart';
import 'package:movies_hub/models/movie.dart';

class HomePopularCard extends StatelessWidget {
  const HomePopularCard({
    super.key,
    required this.height,
    required this.movie,
    required this.onTap,
  });

  final double height;
  final MovieModel movie;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Hero(
                  tag: movie.id,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.poster}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: SizedBox(
                  height: 25,
                  width: double.infinity,
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 12.0,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
