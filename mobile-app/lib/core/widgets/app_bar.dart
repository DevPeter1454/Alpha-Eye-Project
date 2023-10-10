import 'package:flutter/material.dart';
import 'package:alpha_eye/core/widgets/user_avatar.dart';
import 'package:flutter_svg/svg.dart';

import '../cores.dart';

class HomeAppBar extends StatelessWidget {
  final List<Widget>? actions;
  final String? title;
  final Widget? leading;

  const HomeAppBar({Key? key, this.actions, this.title, this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacing.width(0.0),
            const UserAvatar(
              url:
                  'https://www.befunky.com/images/prismic/82e0e255-17f9-41e0-85f1-210163b0ea34_hero-blur-image-3.jpg?auto=avif,webp&format=jpg&width=896',
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Good Evening ',
                    style: TextStyle(
                      color: Color(0xFF4F4F4F),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 0.09,
                    ),
                  ),
                  TextSpan(
                    text: appGlobals.user?.firstname ?? '',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 0.09,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x11101928),
                    blurRadius: 18,
                    offset: Offset(0, 10),
                    spreadRadius: -2,
                  )
                ],
              ),
              child: Center(
                child: SvgPicture.asset(AppAssets.notification),
              ),
            ),
            const Spacing.width(16.0),
          ],
        ),
      ),
    );
  }
}

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function()? onTap;
  final String? title;
  final List<Widget>? actions;

  const BackAppBar({Key? key, this.actions, this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.black,
      elevation: 0,
      title: AppText(
        title ?? '',
        color: AppColors.black,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
