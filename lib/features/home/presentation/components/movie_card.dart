import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/design_system/utils/style.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({
    Key? key,
    required this.title,
    required this.overview,
    required this.imagePath,
  }) : super(key: key);

  final String? title;
  final String overview;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    Widget? poster;

    if (imagePath != null) {
      poster = Image.network(
        'https://image.tmdb.org/t/p/original/$imagePath',
      );
    }

    const pad = AppSizes.halfPadding;
    const gapRow = SizedBox(width: AppSizes.padding);
    const gapColumn = SizedBox(height: AppSizes.halfPadding);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: pad, horizontal: pad),
      child: Container(
        padding: const EdgeInsets.all(pad),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          // border: Border.all(
          //   color: Colors.purple,
          // ),
          color: Colors.pink,
        ),
        height: 200,
        width: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (poster != null) poster,
            gapRow,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? 'title', style: TextStyles.title),
                  gapColumn,
                  Text(
                    overview.isNotEmpty
                        ? overview
                        : 'Não possui sinopse em português.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 7,
                    softWrap: true,
                    style: TextStyles.simple,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
