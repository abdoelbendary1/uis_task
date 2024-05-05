import 'package:e_commerce_app/presentation/auth/signUp/sign_up._screen.dart';
import 'package:e_commerce_app/presentation/utils/constants.dart';
import 'package:e_commerce_app/presentation/utils/custom_button.dart';
import 'package:e_commerce_app/presentation/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBody extends StatefulWidget {
  LoginBody({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.buttonFunction,
  });
  late GlobalKey formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late void Function()? buttonFunction;

  bool isObsecure = true;

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //logo
          Padding(
            padding: EdgeInsets.only(
                top: 91.h, bottom: 46.h, left: 96.w, right: 96.w),
            child: Image.asset(AppAssets.logo),
          ),
          SizedBox(
            height: 20.h,
          ),
          //text
          Padding(
            padding: EdgeInsets.only(left: 16.h, right: 124.h),
            child: Text(
              "Welcom back to route",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h, right: 124.h),
            child: Text(
              "Please sign in with your mail",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 16),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          //form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: widget.formKey,
              child: Column(
                children: [
                  //e-mail
                  CustomTextField(
                    controller: widget.emailController,
                    fieldName: "E-Mail",
                    hintText: "enter your e-mail",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "e-mail field is required";
                      }
                      bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "e-mail is not valid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //password
                  CustomTextField(
                    obscure: widget.isObsecure,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          if (widget.isObsecure == true) {
                            widget.isObsecure = false;
                          } else {
                            widget.isObsecure = true;
                          }
                        });
                      },
                      child: Image.asset(widget.isObsecure
                          ? AppAssets.hidePass
                          : AppAssets.viewPass),
                    ),
                    controller: widget.passwordController,
                    fieldName: "Password",
                    hintText: "enter your password",
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "e-mail field is required";
                      }
                      if (value.length < 5 || value.length > 30) {
                        return "password must be more than 6 char and less than 30 char";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16.h, right: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  // login button
                  CustomButton(
                    buttonText: "Login",
                    buttonFunction: widget.buttonFunction,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          child: Text(
                            "create account",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
