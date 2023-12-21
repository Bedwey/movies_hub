import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_hub/presentation/main/pages/profile_view.dart';

import '../cubit/home_cubit.dart';
import '../cubit/main_cubit.dart';
import 'home_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      buildWhen: (previous, current) => previous.currentIndex != current.currentIndex,
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: [
              BlocProvider(create: (context) => HomeCubit(), child: const HomeView()),
              const Center(child: Text('Search')),
              const Center(child: Text('Favorites')),
              const ProfileView(),
            ],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.currentIndex,
            onDestinationSelected: (index) => context.read<MainCubit>().changeIndex(index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: 'Search',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border_outlined),
                selectedIcon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
