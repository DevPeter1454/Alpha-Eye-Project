import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:alpha_eye/presentation/views/auth/reset_password.dart';

import '../../../core/cores.dart';
import '../../bloc/blocs.dart';

class ForgetPasswordPage extends HookWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTEC = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    final loading = useState(false);
    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            snackBars.success(message: state.error);
          }
          if (state is ForgetPasswordSuccess) {
            snackBars.success(message: 'Password reset pin sent successfully!');
            navigationService.pushReplacement(ResetPasswordPage(
              email: emailTEC.text.trim(),
            ));
          }
        },
        builder: (context, state) {
          return Scaffold(
            //appBar: const HomeAppBar(),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formKey.value,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Spacing.height(36),
                      const AppText(
                        'Forgot Password',
                        fontSize: 24,
                        color: AppColors.sdn900,
                        fontFamily: FontFamily.hovesBold,
                      ),
                      const Spacing.tinyHeight(),
                      const AppText(
                        'Enter the email address for the account you want to recover. We’ll send a verification to the email address if the account exits',
                        fontSize: 16,
                        color: AppColors.sdn600,
                        height: 1.5,
                        alignment: TextAlign.center,
                        // fontFamily: FontFamily.outfitRegular,
                      ),
                      const Spacing.height(48),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            'Email Address',
                            color: AppColors.sdn900,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: emailTEC,
                          ),
                          const Spacing.largeHeight(),
                          AppButton(
                            loading: loading.value,
                            onPressed: () {
                              // snackBars.success(message: 'message');
                              if (!formKey.value.currentState!.validate()) {
                                return;
                              }
                              loading.value = true;
                              authBloc.add(ForgetPasswordEvent(
                                email: emailTEC.text,
                              ));
                            },
                            title: 'Confirm Email',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
