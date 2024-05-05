import 'package:e_commerce_app/presentation/home_screen/widget/item_card_body.dart';
import 'package:e_commerce_app/presentation/home_screen/widget/item_card_header.dart';
import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemCardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemCardHeader(image: MyAssets.itemImage, isWishlisted: false),
          SizedBox(
            height: 7.h,
          ),
          HomeCardItemBody()
        ],
      ),
    );
  }
}
