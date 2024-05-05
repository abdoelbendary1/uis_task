import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowSectionWidget extends StatelessWidget {
  String name;

  RowSectionWidget({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                )),
        /*  InkWell(
          onTap: (){},
          child: Text(
            'View All',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.darkPrimaryColor,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
          ),
        ), */
      ],
    );
  }
}
