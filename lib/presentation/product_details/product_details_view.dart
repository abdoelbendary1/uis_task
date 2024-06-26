import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/domain/entities/home_response_entity/product_entity.dart';
import 'package:e_commerce_app/presentation/product_details/cubit/product_details_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/utils/google_maps/google_maps_view.dart';

import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatelessWidget {
  static String routeName = "product-details-view";
  ProductDetailsViewModel productDetailsViewModel = ProductDetailsViewModel(
    addToFavUseCase: injectAddToFavUseCase(),
    getProductByIdUseCase: injectGetProductByIdUseCase(),
  );

  @override
  Widget build(BuildContext context) {
    var productArgs =
        ModalRoute.of(context)!.settings.arguments as ProductEntity;

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Product details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20.sp,
              color: AppColors.darkPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
        actions: [
          BlocBuilder<ProductDetailsViewModel, ProductDetailsState>(
            bloc: productDetailsViewModel
              ..getProductByID(productArgs.id.toString()),
            builder: (context, state) {
              return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    productDetailsViewModel
                        .addToFavorite(productArgs.id.toString());
                    productDetailsViewModel
                        .getProductByID(productArgs.id.toString());
                  },
                  icon: state is GetProductByIdSuccesState
                      ? state.productResponseEntity.data!.inFavorites == true
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border)
                      : const Icon(Icons.favorite_border));
            },
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.pushNamed(context, GoogleMapsView.routeName);
            },
            icon: const Icon(Icons.location_on_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: Border.all(color: AppColors.greyColor, width: 2)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: ImageSlideshow(
                      initialPage: 0,
                      indicatorColor: AppColors.primaryColor,
                      indicatorBackgroundColor: AppColors.whiteColor,
                      indicatorBottomPadding: 20.h,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: productArgs.images!
                          .map((url) => Image.network(
                                url,
                                fit: BoxFit.cover,
                                height: 300.h,
                                width: double.infinity,
                              ))
                          .toList()),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      productArgs.name ?? "title",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 18.sp,
                            color: AppColors.darkPrimaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Text(
                    "EGP ${productArgs.price.toString()}",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.darkPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "Discount : ${productArgs.discount.toString()} ",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.darkPrimaryColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  )),
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(
                        100.r,
                      ),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 28.sp,
                          ),
                        ),
                        Text(
                          '1',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 28.sp,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Description",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.darkPrimaryColor,
                    ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ReadMoreText(
                productArgs.description ?? "",
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor.withOpacity(
                        0.6,
                      ),
                    ),
                trimCollapsedText: ' Show More',
                trimExpandedText: ' Show Less',
                moreStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkPrimaryColor),
                lessStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.darkPrimaryColor),
              ),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                height: 120.h,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "Total price",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 18.sp,
                                  color: AppColors.primaryColor,
                                ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "EGP ${productArgs.price.toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontSize: 18.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: AppColors.whiteColor,
                          ),
                          Text("Add to cart",
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
