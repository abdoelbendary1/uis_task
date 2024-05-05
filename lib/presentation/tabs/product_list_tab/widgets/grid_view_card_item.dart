import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';
import 'package:e_commerce_app/presentation/product_details/cubit/product_details_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/cubit/home_tab_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/cubit/product_tab_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';

class GridViewCardItem extends StatelessWidget {
  bool isWishlisted = false;
  ProductEntity product;
  GridViewCardItem({
    super.key,
    required this.product,
  });

  //todo: product
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
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
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  product.image ?? "",
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 128.h,
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: BlocBuilder<HomeTabViewModel, HomeTabViewState>(
                    bloc: HomeTabViewModel.get(context),
                    builder: (context, state) {
                      return state is HomeSuccesState
                          ? IconButton(
                              color: AppColors.primaryColor,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                ProductDetailsViewModel.get(context)
                                    .addToFavorite(product.id.toString());
                                HomeTabViewModel.get(context).getHomeData();
                              },
                              icon: product.inFavorites == true
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border))
                          : IconButton(
                              color: AppColors.primaryColor,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                ProductDetailsViewModel.get(context)
                                    .addToFavorite(product.id.toString());
                                HomeTabViewModel.get(context).getHomeData();
                              },
                              icon: product.inFavorites == true
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border));
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              product.name ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  "EGP ${product.price} ",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
            child: Row(
              children: [
                /*  Text(
                  "Review (${product.discount})",
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ), */
                SizedBox(
                  width: 7.w,
                ),
                Image.asset(
                  MyAssets.starIcon,
                ),
                const Spacer(
                  flex: 1,
                ),
                /* InkWell(
                  onTap: () {
                    //todo: add to cart
                    ProductTabViewModel.get(context)
                        .addToCart(productID: product.id ?? "");
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.primaryColor,
                  ),
                ) */
              ],
            ),
          )
          // GridViewCardItemBody(
          //   productEntity: productEntity,
          // )
        ],
      ),
    );
  }
}
