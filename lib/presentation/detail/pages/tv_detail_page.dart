import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_hub/models/tv.dart';
import 'package:movies_hub/presentation/detail/cubit/tv_detail_cubit.dart';

import '../../../core/router/router.dart';
import '../../main/widgets/tv_card.dart';

class TvDetailPage extends StatelessWidget {
  const TvDetailPage({super.key, required this.tv});

  final TvModel tv;

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
          context.read<TvDetailCubit>().toggleFavorite();
        },
        child: BlocBuilder<TvDetailCubit, TvDetailState>(
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
              tag: tv.id,
              child: CachedNetworkImage(
                imageUrl: tv.poster,
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
            Text(tv.name, style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Text(tv.overview ?? ''),
            const SizedBox(height: 10.0),
            Text('Release date: ${tv.releaseDate}'),
            const SizedBox(height: 10.0),
            Text('Popularity: ${tv.popularity}'),
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
        child: BlocBuilder<TvDetailCubit, TvDetailState>(
          buildWhen: (previous, current) => previous.isLoading != current.isLoading,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.simularTvsList.length,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemBuilder: (context, index) {
                return TvCardPoster(
                  tv: state.simularTvsList[index],
                  onTap: () {
                    context.push(Routes.tvRoute, extra: state.simularTvsList[index]);
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
