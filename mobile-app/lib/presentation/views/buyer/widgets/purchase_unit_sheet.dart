import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/cores.dart';

class PurchaseUnitSheet extends StatefulWidget {
  final Function() onPurchase;
  const PurchaseUnitSheet({super.key, required this.onPurchase});

  @override
  State<PurchaseUnitSheet> createState() => _PurchaseUnitSheetState();
}

class _PurchaseUnitSheetState extends State<PurchaseUnitSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        //color: AppColors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacing.height(18),
            const AppText(
              'Unit Purchase',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            const Spacing.height(4.0),
            RichText(
              text: TextSpan(
                text: 'N16,000.73',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.deepBlue,
                  fontWeight: FontWeight.w700,
                ),
                children: const [
                  TextSpan(
                    text: ' per unit',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            const Spacing.height(29),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  'Number of Units',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const Spacing.height(8),
            AppTextField(
              textEditingController: TextEditingController(),
              textInputType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter number of units';
                }
              },
            ),
            const Spacing.height(8),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText(
                  '500 Units available',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const Spacing.height(16),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText(
                  'Number of Units',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            const Spacing.height(8),
            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: AppColors.evaluationBg,
                border: Border.all(
                  color: AppColors.borderColor,
                ),
              ),
              child: const AppText(
                '#2000',
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            const Spacing.height(24),
            AppButton(
              onPressed: widget.onPurchase,
              title: 'Purchase Unit',
            ),
            const Spacing.height(50)
          ],
        ),
      ),
    );
  }
}
