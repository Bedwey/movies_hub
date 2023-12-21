import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_hub/models/movie.dart';
import 'package:movies_hub/presentation/detail/cubit/movie_detail_cubit.dart';
import 'package:movies_hub/presentation/detail/pages/movie_detail_page.dart';

import '../../models/tv.dart';
import '../../presentation/auth/cubit/login_cubit.dart';
import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/detail/cubit/tv_detail_cubit.dart';
import '../../presentation/detail/pages/tv_detail_page.dart';
import '../../presentation/main/cubit/main_cubit.dart';
import '../../presentation/main/pages/main_page.dart';
import '../logic/authentication_cubit.dart';

abstract class Routes {
  static const String homeRoute = '/';
  static const String loginRoute = '/login';
  static const String movieRoute = '/movie';
  static const String tvRoute = '/tv';
}

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.homeRoute,
        builder: (_, __) => BlocProvider(create: (context) => MainCubit(), child: const MainPage()),
      ),
      GoRoute(
        path: Routes.loginRoute,
        builder: (_, __) => BlocProvider(create: (context) => LoginCubit(), child: const LoginPage()),
      ),
      GoRoute(
        path: Routes.movieRoute,
        builder: (_, state) {
          final movieDetail = state.extra as MovieModel;
          return BlocProvider(
            create: (_) => MovieDetailCubit(movieDetail.id),
            child: MovieDetailPage(movie: movieDetail),
          );
        },
      ),
      GoRoute(
        path: Routes.tvRoute,
        builder: (_, state) {
          final tvDetail = state.extra as TvModel;
          return BlocProvider(
            create: (_) => TvDetailCubit(tvDetail.id),
            child: TvDetailPage(tv: tvDetail),
          );
        },
      ),
    ],
    redirect: (context, state) async {
      final status = context.read<AuthenticationCubit>().state.status;
      if (status == AuthenticationStatus.authenticated) {
        return (state.fullPath == Routes.loginRoute) ? Routes.homeRoute : null;
      }
      return Routes.loginRoute;
    },
  );
}
