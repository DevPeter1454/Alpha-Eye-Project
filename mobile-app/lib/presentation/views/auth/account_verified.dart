import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:alpha_eye/presentation/views/buyer/home/bottom_nav.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/cores.dart';

class AccountVerifySuccessPage extends StatefulHookWidget {
  const AccountVerifySuccessPage({
    super.key,
  });

  @override
  State<AccountVerifySuccessPage> createState() =>
      _AccountVerifySuccessPageState();
}

class _AccountVerifySuccessPageState extends State<AccountVerifySuccessPage> {
  @override
  Widget build(BuildContext context) {
    final loading = useState(false);

    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          // if (state is AuthError) {
          //   loading.value = false;
          //   resendingCode.value = false;
          //   snackBars.success(message: state.error);
          // }
          // if (state is VerifyEmailSuccess) {
          //   snackBars.success(message: 'Email Verified!');
          //   navigationService.pushReplacement(const LoginPage());
          // }
          // if (state is ResentVerificationSuccess) {
          //   snackBars.success(message: 'Email Sent!');
          //   resendingCode.value = false;
          //   countdown.value = 60;
          // }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const BackAppBar(),
            backgroundColor: AppColors.white,
            body: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacing.height(5.h),
                  Image.asset(
                    AppAssets.verifyEmail,
                    height: 15.h,
                    width: 50.w,
                  ),
                  const Spacing.height(36),
                  const AppText(
                    'Your account has been verified successfully',
                    fontSize: 24,
                    color: AppColors.sdn900,
                    alignment: TextAlign.center,
                  ),
                  const Spacing.tinyHeight(),
                  RichText(
                    text: const TextSpan(
                      text:
                          'Lorem ipsum dolor sit amet consectetur. A nullam volutpat neque risus a suspendisse sed quis nec.',
                      children: [
                        TextSpan(
                          text: '',
                          style: TextStyle(
                            color: AppColors.sdn900,
                            fontSize: 16,
                          ),
                        ),
                      ],
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.sdn600,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Spacing.height(21),
                  const Spacer(),
                  //const Spacing.height(16),
                  AppButton(
                    loading: loading.value,
                    onPressed: () {
                      navigationService.pushReplacement(const BuyerHome());
                    },
                    title: 'Continue',
                  ),
                  const Spacing.height(21),
                ],
              ),
            ),
          );
        });
  }
}

// class AccountVerifySuccessPage extends HookWidget {
//   final String email;
//   const AccountVerifySuccessPage({
//     Key? key,
//     required this.email,
//   }) : super(key: key);

  
// }
