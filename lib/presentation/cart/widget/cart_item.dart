/* // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/presentation/cart/cubit/cart_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_colors.dart';

class CartItem extends StatelessWidget {
  /* late GetCartProductEntity cartEntity; */
  CartItem({
    super.key,
   /*  required this.cartEntity, */
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 1.w, color: AppColors.lightGreyColor)),
        width: 398.w,
        height: 145.h,
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
         /*    child: Image.network(cartEntity.product!.imageCover ?? ""), */
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text("${cartEntity.product!.title}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
                        ),
                        InkWell(
                          onTap: () {
                            //todo: delete item in cart
                            print(cartEntity.id);
                            print(cartEntity.product!.id);
                            CartViewModelCubit.get(context).deleteCartItems(
                                productID: cartEntity.id ?? "");
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            color: AppColors.primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 0.h),
                    child: Row(
                      children: [
                        Text('Count: ${cartEntity.count}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.blueGreyColor)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 0.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('EGP ${cartEntity.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold)),
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
                                  onPressed: () {
                                    //todo: decrement count
                                    int counter = cartEntity.count!;
                                    counter--;
                                    //todo: increment count
                                    CartViewModelCubit.get(context)
                                        .updateCartItem(
                                            productID: cartEntity.id!,
                                            count: counter);
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: AppColors.whiteColor,
                                    size: 28.sp,
                                  ),
                                ),
                                Text(
                                  '${cartEntity.count}',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.whiteColor),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    int counter = cartEntity.count!;
                                    counter++;
                                    //todo: increment count
                                    CartViewModelCubit.get(context)
                                        .updateCartItem(
                                            productID: cartEntity.id!,
                                            count: counter);
                                  },
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
                    ),
                  )
                ]),
          )),
        ]),
      ),
    );
  }
}
 */