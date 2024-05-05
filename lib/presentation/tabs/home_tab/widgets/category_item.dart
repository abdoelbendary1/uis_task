// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';
import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandsEntity categoryOrBrandsEntity;
  CategoryOrBrandItem({
    super.key,
    required this.categoryOrBrandsEntity,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: NetworkImage(categoryOrBrandsEntity.image ?? ""),
            radius: 50.r,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(
            categoryOrBrandsEntity.name ?? "Category",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        )
      ],
    );
  }
}
