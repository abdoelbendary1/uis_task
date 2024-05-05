import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/domain/di.dart';
import 'package:e_commerce_app/presentation/auth/login/login_screen.dart';
import 'package:e_commerce_app/presentation/auth/signUp/sign_up._screen.dart';
import 'package:e_commerce_app/presentation/cart/cart_screen.dart';
import 'package:e_commerce_app/presentation/home_screen/cubit/home_screen_view_model.dart';
import 'package:e_commerce_app/presentation/home_screen/home_screen_view.dart';
import 'package:e_commerce_app/presentation/product_details/cubit/product_details_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/product_details/product_details_view.dart';
import 'package:e_commerce_app/presentation/splash/splash_screen.dart';
import 'package:e_commerce_app/presentation/tabs/home_tab/cubit/home_tab_view_model_cubit.dart';
import 'package:e_commerce_app/presentation/utils/shared_prefrence.dart';
import 'package:e_commerce_app/presentation/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'domain/my_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //auto login
  await SharedPrefrence.init();
  var token = SharedPrefrence.getData(key: "token");
  late String route;
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreenView.routeName;
  }

  Bloc.observer = MyBlocObserver();

  runApp(
    DevicePreview(
      builder: (context) => MyApp(
        route: route,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.route});
  late String route;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeScreenViewModel>(
          create: (context) => HomeScreenViewModel(),
        ),
        BlocProvider<ProductDetailsViewModel>(
          create: (context) => ProductDetailsViewModel(
              addToFavUseCase: injectAddToFavUseCase(),
              getProductByIdUseCase: injectGetProductByIdUseCase()),
        ),
        BlocProvider<HomeTabViewModel>(
          create: (context) => HomeTabViewModel(
              getHomeDataUseCase: injectGetHomeDataUseCase(),
              searchProductsUseCase: injectSearchProductsUseCase()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          initialRoute: route,
          routes: {
            SplashScreen.routeName: (context) => const SplashScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
            HomeScreenView.routeName: (context) => HomeScreenView(),
            ProductDetailsView.routeName: (context) => ProductDetailsView(),
            /* CartScreen.routeName: (context) => CartScreen(), */
          },
          theme: AppTheme.mainTheme,
        ),
      ),
    );
  }
}
