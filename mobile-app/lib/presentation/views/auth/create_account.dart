import 'package:alpha_eye/presentation/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/cores.dart';

import '../../bloc/blocs.dart';
import 'verify_account.dart';

class CreateAccountPage extends HookWidget {
  const CreateAccountPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailTEC = useTextEditingController();
    final passwordTEC = useTextEditingController();
    final confirmpasswordTEC = useTextEditingController();
    final firstNameTEC = useTextEditingController();
    final lastNameTEC = useTextEditingController();
    final phoneNumberTEC = useTextEditingController();
    final formKey = useState(GlobalKey<FormState>());
    final loading = useState(false);
    final passwordVisible = useState(false);
    final confirmpasswordVisible = useState(false);
    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            snackBars.error(message: state.error);
          }
          if (state is RegisterSuccess) {
            snackBars.success(message: 'Registration Successful');
          }
        },
        builder: (context, state) {
          return Scaffold(
            //appBar: const BackAppBar(),
            backgroundColor: AppColors.scaffoldBg,
            body: SingleChildScrollView(
              child: Form(
                key: formKey.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacing.height(36 + 56),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: AppText(
                        'Welcome!',
                        fontSize: 24,
                        color: AppColors.sdn900,
                        fontFamily: FontFamily.hovesBold,
                      ),
                    ),
                    //const Spacing.height(35),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: AppText(
                        'A Vision for Wellness: Enhance your eye health journey with us.',
                        fontSize: 16,
                        color: AppColors.sdn600,
                        // fontFamily: FontFamily.hovesRegular,
                      ),
                    ),
                    const Spacing.height(47.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText(
                            'First Name',
                            color: AppColors.black,
                            fontFamily: FontFamily.hovesRegular,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: firstNameTEC,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter first name' : null,
                            textCapitalization: TextCapitalization.words,
                            hintText: 'First Name',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Last Name',
                            color: AppColors.black,
                            fontFamily: FontFamily.hovesRegular,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: lastNameTEC,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter last name' : null,
                            textCapitalization: TextCapitalization.words,
                            hintText: 'Last Name',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Email Address',
                            color: AppColors.black,
                            fontFamily: FontFamily.hovesRegular,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: emailTEC,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            validator: (val) => val!.isEmpty
                                ? 'Please enter a valid Email\n'
                                : null,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'Email Address',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Password',
                            color: AppColors.black,
                            fontFamily: FontFamily.hovesRegular,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: passwordTEC,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            hintText: 'Password',
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter password' : null,
                            obscureText: !passwordVisible.value,
                            obscureChar: '●',
                            suffixIcon: IconButton(
                              onPressed: () => passwordVisible.value =
                                  !passwordVisible.value,
                              icon: passwordVisible.value
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_outlined,
                                      color: AppColors.black,
                                    ),
                            ),
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Confirm Password',
                            color: AppColors.black,
                            fontFamily: FontFamily.hovesRegular,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: confirmpasswordTEC,
                            textInputAction: TextInputAction.done,
                            hintText: 'Confirm Password',
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter password' : null,
                            obscureText: !confirmpasswordVisible.value,
                            maxLines: 1,
                            obscureChar: '●',
                            suffixIcon: IconButton(
                              onPressed: () => confirmpasswordVisible.value =
                                  !confirmpasswordVisible.value,
                              icon: confirmpasswordVisible.value
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: AppColors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility_outlined,
                                      color: AppColors.black,
                                    ),
                            ),
                          ),
                          const Spacing.height(30),
                          AppButton(
                            loading: loading.value,
                            onPressed: () {
                              if (!formKey.value.currentState!.validate()) {
                                return;
                              }
                              loading.value = true;
                              // authBloc.add(
                              //   RegisterEvent(
                              //       param: RegisterParam(
                              //     email: emailTEC.text.trim(),
                              //     firstName: firstNameTEC.text.trim(),
                              //     lastName: lastNameTEC.text.trim(),
                              //     password: passwordTEC.text.trim(),
                              //     phoneNumber:
                              //         '+234${phoneNumberTEC.text.trim()}',
                              //   )),
                              // );
                              navigationService.pushReplacement(
                                VerifyEmailPage(
                                  email: emailTEC.text.trim(),
                                  firstName: firstNameTEC.text.trim(),
                                  lastName: lastNameTEC.text.trim(),
                                  password: passwordTEC.text.trim(),
                                ),
                              );
                            },
                            title: 'Proceed',
                          ),
                          const Spacing.height(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const AppText(
                                'Already have an account?',
                                fontSize: 16,
                                color: AppColors.sdn600,
                                // fontFamily: FontFamily.hovesRegular,
                              ),
                              TextButton(
                                  onPressed: () =>
                                      navigationService.push(const LoginPage()),
                                  child: const AppText(
                                    'Login here',
                                    color: AppColors.primary,
                                    fontSize: 16,
                                    fontFamily: FontFamily.hovesSemiBold,
                                  )),
                            ],
                          ),
                          const Spacing.largeHeight(),
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
