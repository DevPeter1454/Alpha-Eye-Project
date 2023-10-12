import 'package:alpha_eye/presentation/views/auth/login.dart';
import 'package:alpha_eye/presentation/views/buyer/home/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/cores.dart';
import '../../../data/data.dart';
import '../../bloc/blocs.dart';

class MoreInfo extends StatefulHookWidget {
  final String firstName;
  final String lastName;
  final String password;
  final String email;
  const MoreInfo(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.password,
      required this.email});

  @override
  State<MoreInfo> createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  @override
  Widget build(BuildContext context) {
    final genderTEC = useTextEditingController();

    final addressTEC = useTextEditingController();
    final cityTEC = useTextEditingController();
    final stateTEC = useTextEditingController();
    final phoneTEC = useTextEditingController();
    final ageTEC = useTextEditingController();
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
            navigationService.pushReplacement(
              const LoginPage(),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const BackAppBar(),
            backgroundColor: AppColors.scaffoldBg,
            body: SingleChildScrollView(
              child: Form(
                key: formKey.value,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: AppText(
                        'Tell us a bit about you!',
                        fontSize: 24,
                        color: AppColors.sdn900,
                        fontWeight: FontWeight.w500,
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
                            'Gender',
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: genderTEC,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter first name' : null,
                            textCapitalization: TextCapitalization.words,
                            hintText: 'Gender',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Age',
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: ageTEC,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter first name' : null,
                            textCapitalization: TextCapitalization.words,
                            textInputType: TextInputType.number,
                            hintText: 'Age',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'State of residence',
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: stateTEC,
                            validator: (val) =>
                                val!.isEmpty ? 'Please enter last name' : null,
                            textCapitalization: TextCapitalization.words,
                            hintText: 'State of residence',
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'City',
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: cityTEC,
                            validator: (val) => val!.isEmpty
                                ? 'Please enter a valid Email\n'
                                : null,
                            textInputType: TextInputType.emailAddress,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            hintText: 'City',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Address',
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: addressTEC,
                            validator: (val) => val!.isEmpty
                                ? 'Please enter a valid Email\n'
                                : null,
                            textInputType: TextInputType.emailAddress,
                            maxLines: 1,
                            textInputAction: TextInputAction.next,
                            hintText: 'Address',
                          ),
                          const Spacing.mediumHeight(),
                          const AppText(
                            'Phone Number',
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          const Spacing.smallHeight(),
                          AppTextField(
                            textEditingController: phoneTEC,
                            validator: (val) => val!.isEmpty
                                ? 'Please enter a valid Email\n'
                                : null,
                            textInputType: TextInputType.number,
                            maxLines: 1,
                            textInputAction: TextInputAction.done,
                            hintText: 'Phone Number',
                          ),
                          const Spacing.height(30),
                          AppButton(
                            loading: loading.value,
                            onPressed: () {
                              if (!formKey.value.currentState!.validate()) {
                                return;
                              }
                              loading.value = true;
                              authBloc.add(
                                RegisterEvent(
                                  param: RegisterParam(
                                    email: widget.email,
                                    firstname: widget.firstName,
                                    lastname: widget.lastName,
                                    password: widget.password,
                                    address: addressTEC.text.trim(),
                                    age: int.parse(ageTEC.text.trim()),
                                    city: cityTEC.text.trim(),
                                    gender: genderTEC.text.trim(),
                                    phone: phoneTEC.text.trim(),
                                    role: 'user',
                                    stateOfResidence: stateTEC.text.trim(),
                                  ),
                                ),
                              );
                            },
                            title: 'Proceed',
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
