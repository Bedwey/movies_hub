import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_hub/pages/main/cubit/main_cubit.dart';
import 'package:movies_hub/pages/main/views/genres/cubit/genres_cubit.dart';
import 'package:movies_hub/pages/main/views/genres/views/genres_view.dart';

import 'home/cubit/home_cubit.dart';
import 'home/views/home_view.dart';
import 'profie/cubit/profile_cubit.dart';
import 'profie/views/profile_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
        builder: (context, state) {
          return IndexedStack(
            index: state.pageIndex,
            children: [
              BlocProvider(create: (_) => HomeCubit(), child: const HomeView()),
              BlocProvider(create: (_) => GenresCubit(), child: const GenresView()),
              BlocProvider(create: (_) => ProfileCubit(), child: const ProfileView()),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
        builder: (context, state) {
          return BottomNavigationBar(
            elevation: 0,
            onTap: (v) => context.read<MainCubit>().changePageIndex(v),
            currentIndex: state.pageIndex,
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidCompass),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'Lists',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
