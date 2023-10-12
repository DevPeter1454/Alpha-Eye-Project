import 'package:flutter/material.dart';

import '../../../../core/cores.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final String icon;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppRectangle(
        radius: 4,
        padding: const EdgeInsets.all(14),
        color: Colors.transparent,
        borderWidth: 1,
        borderColor: AppColors.borderColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              height: 22,
              width: 22,
            ),
            const SizedBox(
              width: 10,
            ),
            AppText(
              text,
              color: AppColors.black,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
