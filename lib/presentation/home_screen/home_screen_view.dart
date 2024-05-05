import 'package:e_commerce_app/presentation/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/presentation/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/presentation/home_screen/widget/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home';

  HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenStates>(
      bloc: homeScreenViewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
            context: context,
            selectedIndex: homeScreenViewModel.selectedIndex,
            onTapFunction: (index) {
              homeScreenViewModel.changeTab(index);
            },
          ),
          body: homeScreenViewModel.tabs[homeScreenViewModel.selectedIndex],
        );
      },
    );
  }
}
