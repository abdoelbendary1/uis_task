// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/domain/entities/home_response_entity/banner_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';

class AnnouncementsSection extends StatelessWidget {
  List<BannerEntity> sliderImages;
  AnnouncementsSection({
    Key? key,
    required this.sliderImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      initialPage: 0,
      indicatorColor: AppColors.primaryColor,
      indicatorBackgroundColor: AppColors.whiteColor,
      indicatorBottomPadding: 20.h,
      autoPlayInterval: 3000,
      isLoop: true,
      children: sliderImages
          .map((banner) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  banner.image ?? "",
                  fit: BoxFit.fill,
                  width: 398.w,
                  height: 200.h,
                ),
              ))
          .toList(),
    );
  }
}
