import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/home_popular_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppBar(
            onPressed: () {},
          ),
          const SizedBox(height: 16.0),
          const PopularList(),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'For you',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
