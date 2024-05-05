// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchItem extends StatelessWidget {
  ProductEntity proudctEntity;
  void Function()? onTap;
  SearchItem({
    Key? key,
    required this.proudctEntity,required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: ListTile(
        subtitleTextStyle: Theme.of(context).textTheme.bodyLarge,
        horizontalTitleGap: 15,
        titleTextStyle:
            Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 18),
        title: SizedBox(
            height: 90.h,
            child: Text(
              proudctEntity.name ?? "",
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            )),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(proudctEntity.price.toString()),
            const Text("EGP"),
          ],
        ),
        leading: Image.network(
          proudctEntity.image ?? "",
          height: 120.h,
          width: 100.w,
        ),
      ),
    );
  }
}
