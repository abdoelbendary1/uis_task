import 'package:e_commerce_app/domain/use_cases/login_useCase.dart';
import 'package:e_commerce_app/presentation/auth/login/cubit/login_state.dart';
import 'package:e_commerce_app/presentation/auth/signUp/sign_up._screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({required this.loginUseCase}) : super(LoginLoadinState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: "abdo121015@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "1234567");

  late void Function()? buttonFunction;
  bool isObsecure = true;
  LoginUseCase loginUseCase;

  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadinState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((failure) {
        emit(LoginErrorState(errorMessege: failure.errorMessege));
      }, (response) {
        emit(LoginSuccesState(loginRepositoryEntity: response));
      });
    }
  }

  void navigateToSignUpScreen(BuildContext context) {
    Navigator.of(context).pushNamed(SignUpScreen.routeName);
  }
}
