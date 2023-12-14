import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_hub/core/router.dart';

import '../cubit/home_cubit.dart';
import 'home_popular_card.dart';

class PopularList extends StatelessWidget {
  const PopularList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.movies != current.movies,
      builder: (context, state) {
        return SizedBox(
          height: (size.height / 2) + 27,
          child: ListView.separated(
            itemCount: state.movies.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) => HomePopularCard(
              movie: state.movies[index],
              height: size.height / 2,
              onTap: () {
                context.push(Routes.detailRoute, extra: state.movies[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
