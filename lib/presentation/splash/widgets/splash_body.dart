import 'package:flutter/material.dart';
import 'package:e_commerce_app/presentation/utils/constants.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.splashScreen,
      fit: BoxFit.cover,
      filterQuality: FilterQuality.high,
      width: double.infinity,
      height: double.infinity,
    );
  }
}
