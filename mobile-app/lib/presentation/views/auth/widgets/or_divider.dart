import 'package:flutter/material.dart';

import '../../../../core/cores.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            height: 1,
            color: AppColors.sdn200,
          ),
        ),
        const Spacing.mediumWidth(),
        const AppText(
          'or sign up with',
          fontFamily: FontFamily.hovesMedium,
          color: Color(0xFF979797),
          fontSize: 16,
        ),
        const Spacing.mediumWidth(),
        Expanded(
          child: Container(
            width: double.maxFinite,
            height: 1,
            color: AppColors.sdn200,
          ),
        )
      ],
    );
  }
}
