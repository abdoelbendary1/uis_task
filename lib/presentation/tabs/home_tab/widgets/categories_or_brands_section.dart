// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/domain/entities/category_or_brand_response_entity/category_or_brands_response_entity.dart';

import 'category_item.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  List<CategoryOrBrandsEntity> list;

  CategoriesOrBrandsSection({
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: GridView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(
              categoryOrBrandsEntity: list[index],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          )),
    );
  }
}
