import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movies',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'Popular now',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.grey, height: 0.5),
              ),
            ],
          ),
          IconButton(
            onPressed: onPressed,
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
