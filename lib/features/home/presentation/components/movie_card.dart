import 'package:flutter/material.dart';
import 'package:movie_app/design_system/utils/sizes.dart';
import 'package:movie_app/design_system/utils/style.dart';

class HomeMovieCard extends StatelessWidget {
  const HomeMovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var image = Image.network(
      'https://picsum.photos/250?image=9',
    );

    const gap = SizedBox(width: AppSizes.padding);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.halfPadding),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.halfPadding),
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
            image,
            gap,
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('title', style: TextStyles.title),
                  gap,
                  Text(
                    teste + teste + teste + teste,
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

const String teste =
    'overview overview overview overview overview overview overview overview overview overview overview';
