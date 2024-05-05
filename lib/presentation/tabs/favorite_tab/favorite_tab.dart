import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/presentation/tabs/favorite_tab/cubit/fav_tab_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/cubit/home_tab_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/widgets/search_item.dart';
import 'package:e_commerce_app/presentation/tabs/product_list_tab/widgets/grid_view_card_item.dart';
import 'package:e_commerce_app/presentation/utils/my_assets.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteTab extends StatelessWidget {
  FavTabViewModel viewModel =
      FavTabViewModel(getFavListUseCase: injectGetFavListUseCase());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: BlocBuilder<FavTabViewModel, FavTabStates>(
          bloc: viewModel..getFavList(),
          builder: (context, state) {
            return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18.h,
                  ),
                  /* CustomSearchWithShoppingCart(), */
                  state is FavTabSuccesState
                      ? Expanded(
                          flex: 8,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              thickness: 2,
                            ),
                            itemCount: state
                                .favoriteListResponseEntity.data!.data!.length,
                            itemBuilder: (context, index) {
                              return SearchItem(
                                proudctEntity: state.favoriteListResponseEntity
                                    .data!.data![index].product!,
                                onTap: () {},
                              );
                            },
                          ),
                        )
                      : Center(child: CircularProgressIndicator()),
                  SizedBox(
                    height: 24.h,
                  ),
                ]);
          },
        ),
      ),
    );
  }
}
