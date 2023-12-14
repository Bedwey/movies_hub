import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_hub/models/movie.dart';
import 'package:movies_hub/pages/details/cubit/details_cubit.dart';
import 'package:movies_hub/pages/details/views/details_view.dart';
import 'package:movies_hub/pages/main/cubit/main_cubit.dart';

import '../pages/main/views/main_view.dart';

abstract class Routes {
  static const String mainRoute = '/';
  static const String detailRoute = '/details';
}

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.mainRoute,
        builder: (context, state) => BlocProvider(create: (_) => MainCubit(), child: const MainView()),
      ),
      GoRoute(
        path: Routes.detailRoute,
        builder: (context, state) => BlocProvider(
          create: (_) => DetailsCubit(),
          child: DetailsView(
            movie: state.extra as MovieModel,
          ),
        ),
      ),
    ],
  );
}
