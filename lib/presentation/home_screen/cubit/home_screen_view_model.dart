import 'package:e_commerce_app/presentation/home_screen/cubit/home_screen_states.dart';
import 'package:e_commerce_app/presentation/tabs/favorite_tab/favorite_tab.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/home_tab.dart';
import 'package:e_commerce_app/presentation/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitial());

  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeTab(),
    /*  ProductListTab(), */
    FavoriteTab(),
    ProfileTab()
  ];

  static HomeScreenViewModel get(context) => BlocProvider.of(context);

  void changeTab(int newSelectedIndex) {
    selectedIndex = newSelectedIndex;
    emit(BottomNavigationBarState());
  }
}
