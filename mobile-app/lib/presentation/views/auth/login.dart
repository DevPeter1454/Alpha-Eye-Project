import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:alpha_eye/presentation/views/auth/create_account.dart';

import '../../../core/cores.dart';
import '../../bloc/blocs.dart';
import '../app_nav/app_nav.dart';
import 'forget_password.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTEC = useTextEditingController();
    final passwordTEC = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    final loading = useState(false);
    final passwordVisible = useState(false);
    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            log(state.error);
            snackBars.error(message: state.error);
          }
          if (state is LoginSuccess) {
            loading.value = false;
            snackBars.success(
                message: 'Welcome, ${appGlobals.user?.firstname}');

            navigationService.pushReplacement(const AppNav());
            //navigationService.pushReplacement(const IntroScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBg,
            body: SingleChildScrollView(
              child: Form(
                key: formKey.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacing.height(36 + 56),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: AppText(
                        'Hello!',
                        fontSize: 28,
                        color: AppColors.sdn900,
                      ),
                    ),
                    const Spacing.tinyHeight(),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: AppText(
                        'A Vision for Wellness: Enhance your eye health journey with us.',
                        fontSize: 18,
                        color: AppColors.sdn600,
                        // fontFamily: FontFamily.hovesRegular,
                      ),
                    ),
                    const Spacing.height(43),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            'Email Address',
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: emailTEC,
                            hintText: 'Email Address',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Password',
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: passwordTEC,
                            obscureText: !passwordVisible.value,
                            maxLines: 1,
                            obscureChar: '●',
                            hintText: 'Password',
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () => passwordVisible.value =
                                  !passwordVisible.value,
                              icon: passwordVisible.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility_off),
                            ),
                          ),
                          const Spacing.smallHeight(),
                          TextButton(
                              onPressed: () => navigationService
                                  .push(const ForgetPasswordPage()),
                              child: const AppText(
                                'Forgot Password?',
                                color: AppColors.primary,
                                fontSize: 16,
                              )),
                          const Spacing.height(28),
                          AppButton(
                            loading: loading.value,
                            onPressed: () {
                              // snackBars.success(message: 'message');
                              if (!formKey.value.currentState!.validate()) {
                                return;
                              }
                              loading.value = true;

                              authBloc.add(
                                LoginEvent(
                                  email: emailTEC.text.trim(),
                                  password: passwordTEC.text.trim(),
                                ),
                              );
                            },
                            title: 'Login',
                          ),
                          const Spacing.height(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const AppText(
                                'Don\'t have an account?',
                                fontSize: 16,
                                color: AppColors.sdn600,
                                // fontFamily: FontFamily.hovesRegular,
                              ),
                              TextButton(
                                onPressed: () => navigationService
                                    .push(const CreateAccountPage()),
                                child: const AppText(
                                  'Signup here',
                                  color: AppColors.primary,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
