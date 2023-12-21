import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_hub/models/movie.dart';
import 'package:movies_hub/presentation/detail/cubit/movie_detail_cubit.dart';

import '../../../core/router/router.dart';
import '../../main/widgets/movie_card.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildSliverBody(),
          _buildSimilarMovies(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<MovieDetailCubit>().toggleFavorite();
        },
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          buildWhen: (previous, current) => previous.isFavorite != current.isFavorite,
          builder: (context, state) {
            return Icon(
              state.isFavorite ? Icons.favorite : Icons.favorite_border,
            );
          },
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Hero(
              tag: movie.id,
              child: CachedNetworkImage(
                imageUrl: movie.poster,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.0, 0.1],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSliverBody() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(movie.title, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Text(movie.overview ?? ''),
            const SizedBox(height: 10.0),
            Text('Release date: ${movie.releaseDate}'),
            const SizedBox(height: 10.0),
            Text('Popularity: ${movie.popularity}'),
            const SizedBox(height: 10.0),
            // Build Similar Movies
            const SizedBox(height: 20.0),
            const Text('Similar Movies', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  _buildSimilarMovies() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300.h,
        width: double.infinity,
        child: BlocBuilder<MovieDetailCubit, MovieDetailState>(
          buildWhen: (previous, current) => previous.isLoading != current.isLoading,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.simularMoviesList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return MovieCardPoster(
                  movie: state.simularMoviesList[index],
                  onTap: () {
                    context.push(Routes.movieRoute, extra: state.simularMoviesList[index]);
                  },
                );
              },
              separatorBuilder: (_, __) => const SizedBox(width: 10.0),
            );
          },
        ),
      ),
    );
  }
}
