import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/core/widgets/user_avatar.dart';
import 'package:alpha_eye/data/datasources/local/base/hive_boxes.dart';
import 'package:alpha_eye/presentation/views/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsView extends StatefulHookWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const BackAppBar(
                title: 'My Profile',
              ),
              AppRectangle(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                color: AppColors.white,
                radius: 4,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const UserAvatar(
                        height: 60,
                        width: 60,
                        url:
                            'https://www.befunky.com/images/prismic/82e0e255-17f9-41e0-85f1-210163b0ea34_hero-blur-image-3.jpg?auto=avif,webp&format=jpg&width=896',
                      ),
                      AppText(
                        'Hello ${appGlobals.user?.lastname}',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacing.height(24),
              GestureDetector(
                onTap: () {},
                child: const AppRectangle(
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                  color: AppColors.white,
                  radius: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppText(
                            'Profile Image',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyText,
                          ),
                          Spacing.height(4.0),
                          AppText(
                            'Change Profile image',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.black,
                      )
                    ],
                  ),
                ),
              ),

              const Spacing.height(8.0),
              ////Phone Number
              AppRectangle(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                color: AppColors.white,
                radius: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AppText(
                          'Full Name',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyText,
                        ),
                        const Spacing.height(4.0),
                        AppText(
                          '${appGlobals.user?.firstname} ${appGlobals.user?.lastname}',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacing.height(8.0),

              ///Email
              AppRectangle(
                padding:
                    const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                color: AppColors.white,
                radius: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AppText(
                          'Phone Number',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyText,
                        ),
                        const Spacing.height(4.0),
                        AppText(
                          appGlobals.user?.phone ?? '',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const Spacing.height(8.0),

              ///Change Password
              GestureDetector(
                onTap: () {},
                child: AppRectangle(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  color: AppColors.white,
                  radius: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const AppText(
                            'Email Address',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyText,
                          ),
                          const Spacing.height(4.0),
                          AppText(
                            appGlobals.user?.email ?? '',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              ///
              ///
              ///
              const Spacing.height(8.0),

              ///Log Out
              GestureDetector(
                onTap: () async {
                  await Hive.box(HiveBoxes.appBox).clear();
                  await Hive.box(HiveBoxes.authBox).clear();
                  navigationService.pushReplacement(const LoginPage());
                },
                child: const AppRectangle(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
                  color: AppColors.white,
                  radius: 4,
                  child: AppText(
                    'Log Out',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.burntRed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
