import 'package:e_commerce_app/presentation/home_screen/widget/item_card.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppliancesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Home Appliance",
          style: TextStyle(color: AppColors.darkPrimaryColor, fontSize: 18.sp),
        ),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.235,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.5.w),
                  child: ItemCardHome(),
                );
              }),
        ),
      ],
    );
  }
}
