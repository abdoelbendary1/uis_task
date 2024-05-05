import 'package:e_commerce_app/domain/di.dart';

import 'package:e_commerce_app/presentation/product_details/product_details_view.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/cubit/home_tab_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/annountcements_section.dart';

import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/row_section_widgets.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/search_item.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/widgets/grid_view_card_item.dart';

import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel homeTabViewModel = HomeTabViewModel(
      getHomeDataUseCase: injectGetHomeDataUseCase(),
      searchProductsUseCase: injectSearchProductsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeTabViewModel..getHomeData(),
      child: BlocBuilder<HomeTabViewModel, HomeTabViewState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.83,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 18.h,
                      ),
                      CustomSearchWithShoppingCart(),
                      SizedBox(
                        height: 16.h,
                      ),
                      if (state is HomeLoadingState) ...[
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ] else if (state is HomeSuccesState) ...[
                        AnnouncementsSection(
                          sliderImages:
                              state.homeResponseEntity!.data!.banners!,
                        ),
                      ],
                      SizedBox(
                        height: 32.h,
                      ),
                      RowSectionWidget(
                        name: 'Trending Products',
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      if (state is HomeLoadingState) ...[
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ] else if (state is HomeSuccesState) ...[
                        Expanded(
                          flex: 8,
                          child: GridView.builder(
                            itemCount: state
                                .homeResponseEntity!.data!.products!.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2.4,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      ProductDetailsView.routeName,
                                      arguments: state.homeResponseEntity!.data!
                                          .products![index],
                                    );
                                  },
                                  child: GridViewCardItem(
                                    product: state.homeResponseEntity!.data!
                                        .products![index],
                                  ));
                            },
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 18.h,
                      ),
                      if (state is SearchLoadingState) ...[
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      ] else if (state is SearchSuccesState) ...[
                        Expanded(
                          flex: 8,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              thickness: 2,
                            ),
                            itemCount:
                                state.searchResponseEntity!.data!.data!.length,
                            itemBuilder: (context, index) {
                              return SearchItem(
                                proudctEntity: state
                                    .searchResponseEntity!.data!.data![index],
                                onTap: () {
                                  homeTabViewModel.navigateToProductDetails(
                                    context,
                                    productEntity: state.searchResponseEntity!
                                        .data!.data![index],
                                  );
                                },
                              );
                            },
                          ),
                        )
                      ],
                      SizedBox(
                        height: 32.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
