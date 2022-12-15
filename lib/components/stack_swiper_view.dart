import 'package:flutter/material.dart';
import 'package:movie_app/components/swiper_view.dart';

import 'package:movie_app/theme/app_assets.dart';
import 'package:movie_app/theme/app_colors.dart';
import 'package:movie_app/theme/app_style.dart';

// ignore: must_be_immutable
class StackSwiperView extends StatelessWidget {
  const StackSwiperView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppAssets.bgsc,
          fit: BoxFit.fitHeight,
        ),
        Image.asset(
          AppAssets.bg,
          fit: BoxFit.fitHeight,
        ),
        Positioned(
          top: 100,
          left: 30,
          child: Text(
            'Trending',
            style: AppStyles.h2.copyWith(color: AppColors.mainColor),
          ),
        ),
        Positioned(
          height: 60,
          width: 80,
          bottom: 90,
          right: 0,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'No. ', style: AppStyles.h4),
                    TextSpan(text: '1', style: AppStyles.h1),
                  ],
                ),
              ),
            ),
          ),
        ),
        SwiperView(),
      ],
    );
  }
}
