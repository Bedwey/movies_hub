import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_hub/core/router/router.dart';
import 'package:movies_hub/core/theme/styles.dart';
import 'package:movies_hub/presentation/main/cubit/home_cubit.dart';
import 'package:movies_hub/presentation/main/widgets/movie_card.dart';
import 'package:movies_hub/presentation/main/widgets/tv_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Movies', style: TextStyles.font24BlackBold),
                  Text(
                    'Popular now',
                    style: TextStyle(
                      height: 1.0,
                      fontSize: 20.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.popularMoviesList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      return MovieCardPoster(
                        movie: state.popularMoviesList[index],
                        onTap: () {
                          context.push(Routes.movieRoute, extra: state.popularMoviesList[index]);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10.0),
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tv', style: TextStyles.font24BlackBold),
                  Text(
                    'Popular now',
                    style: TextStyle(
                      height: 1.0,
                      fontSize: 20.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: 200.h,
              width: double.infinity,
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.popularTvsList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemBuilder: (context, index) {
                      return TvCardPoster(
                        tv: state.popularTvsList[index],
                        onTap: () {
                          context.push(Routes.tvRoute, extra: state.popularTvsList[index]);
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 10.0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
