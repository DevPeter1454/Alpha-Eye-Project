import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:alpha_eye/presentation/views/auth/login.dart';
import 'package:pinput/pinput.dart';

import '../../../core/cores.dart';
import '../../../data/models/params/reset_password_param.dart';
import '../../bloc/blocs.dart';

class ResetPasswordPage extends StatefulHookWidget {
  final String email;
  const ResetPasswordPage({super.key, required this.email});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final passwordTEC = useTextEditingController();
    final confirmPassTEC = useTextEditingController();
    final loading = useState(false);
    final showRetry = useState(false);
    final pin = useState('');
    final countdown = useState(60);
    final resendingCode = useState(false);

    // useEffect(() {
    //   Timer.periodic(const Duration(seconds: 1), (t) {
    //     countdown.value = countdown.value - 1;
    //     if (countdown.value == 0) t.cancel();
    //   });
    // }, []);

    return BlocConsumer(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthError) {
            loading.value = false;
            resendingCode.value = false;
            snackBars.success(message: state.error);
          }
          if (state is ResetPasswordSuccess) {
            snackBars.success(message: 'Password Reset Successful!');
            navigationService.pushReplacement(const LoginPage());
          }
          if (state is ResentVerificationSuccess) {
            snackBars.success(message: 'Email Sent!');
            resendingCode.value = false;
            // countdown.value = 60;
          }
        },
        builder: (context, state) {
          return Scaffold(
            //appBar: const HomeAppBar(),
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacing.height(36),
                    GestureDetector(
                      onTap: () => navigationService.pop(),
                      child: Container(
                        width: 56,
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.50, color: Color(0xFFE1E8F0)),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Back',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF0D172A),
                              fontSize: 16,
                              fontFamily: 'hoves',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacing.height(36),
                    const AppText(
                      'Set New Password',
                      fontSize: 24,
                      color: AppColors.sdn900,
                      fontWeight: FontWeight.w600,
                    ),
                    const Spacing.tinyHeight(),
                    RichText(
                      text: TextSpan(
                          text:
                              'Check your email. We sent a confirmation email containing a 6 digits code to ',
                          children: [
                            TextSpan(
                              text: widget.email,
                              style: const TextStyle(
                                color: AppColors.sdn900,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ],
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.sdn600,
                            fontWeight: FontWeight.w600,
                          )),
                      textAlign: TextAlign.center,
                    ),
                    const Spacing.height(56),
                    Pinput(
                      length: 6,
                      onCompleted: (value) {
                        pin.value = value;
                      },
                      closeKeyboardWhenCompleted: true,
                      autofocus: true,
                      cursor: Container(),
                      defaultPinTheme: PinTheme(
                          height: 48,
                          width: 48,
                          textStyle: const TextStyle(
                            color: AppColors.sdn900,
                            fontWeight: FontWeight.w700,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.sdn200,
                              width: 1,
                            ),
                          )),
                    ),
                    const Spacing.height(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppText(
                          'New Password',
                          color: AppColors.sdn900,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        const Spacing.smallHeight(),
                        AppTextField(
                          textEditingController: passwordTEC,
                        ),
                        const Spacing.largeHeight(),
                        const AppText(
                          'Confirm new Password',
                          color: AppColors.sdn900,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        const Spacing.smallHeight(),
                        AppTextField(
                          textEditingController: confirmPassTEC,
                        ),
                      ],
                    ),
                    const Spacing.height(20.0),
                    AppButton(
                      loading: loading.value,
                      onPressed: () {
                        // snackBars.success(message: 'message');
                        if (pin.value.isEmpty) {
                          snackBars.error(
                              message:
                                  'Please enter the code that was sent to your email');
                          return;
                        }
                        if (passwordTEC.text.isEmpty ||
                            confirmPassTEC.text.isEmpty) {
                          snackBars.error(
                              message:
                                  'Please enter Password and Confirm Password');
                          return;
                        }
                        if (passwordTEC.text != confirmPassTEC.text) {
                          snackBars.error(message: 'Both Password must match');
                          return;
                        }
                        loading.value = true;
                        authBloc.add(
                          ResetPasswordEvent(
                            param: ResetPasswordParam(
                              token: pin.value,
                              email: widget.email,
                              password: passwordTEC.text,
                            ),
                          ),
                        );
                      },
                      title: 'Set Password',
                    ),
                    const Spacing.height(32.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          'Yet to receive verification code?',
                          fontSize: 16,
                          color: AppColors.sdn600,
                          // fontFamily: FontFamily.hovesRegular,
                        ),
                        TextButton(
                          onPressed: () {
                            resendingCode.value = true;
                            authBloc.add(
                                ResendVerificationEvent(email: widget.email));
                          },
                          child: Visibility(
                            visible: !resendingCode.value,
                            replacement: const Center(
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            child: const AppText(
                              'Resend New Code',
                              color: AppColors.primary,
                              fontSize: 20,
                              textDecoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        // TextButton(
                        //   onPressed: () {},
                        //   child: const AppText(
                        //     'Resend New Code',
                        //     color: AppColors.sdp600,
                        //     fontSize: 20,
                        //     textDecoration: TextDecoration.underline,
                        //     fontFamily: FontFamily.hovesBold,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
