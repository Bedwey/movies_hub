import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_hub/models/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../../../locator.dart';

class TvCardPoster extends StatelessWidget {
  const TvCardPoster({
    super.key,
    required this.tv,
    required this.onTap,
  });

  final TvModel tv;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Hero(
                tag: tv.id,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(locator<TMDB>().images.getUrl(tv.poster, size: ImageSizes.POSTER_SIZE_MEDIUMPLUS)!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SizedBox(
                height: 25,
                width: double.infinity,
                child: Text(
                  tv.name,
                  style: const TextStyle(
                    fontSize: 12.0,
                    overflow: TextOverflow.ellipsis,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
