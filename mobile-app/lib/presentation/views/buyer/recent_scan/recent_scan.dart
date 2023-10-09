import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/presentation/views/buyer/scan_detail/scan_details.dart';
import 'package:alpha_eye/presentation/views/buyer/widgets/scan_card.dart';
import 'package:flutter/material.dart';

class RecentScanView extends StatefulWidget {
  const RecentScanView({super.key});

  @override
  State<RecentScanView> createState() => _RecentScanViewState();
}

class _RecentScanViewState extends State<RecentScanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(
        title: 'Recent Scan',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacing.height(26),
            const AppText(
              'Check out your scan history and see details',
              fontSize: 18,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
            const Spacing.height(16),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigationService.push(const ScanDetailView());
                    },
                    child: const ScanCard(
                      title: 'Scan 00592893',
                      date: '12/12/2021',
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Spacing.height(16);
                },
                itemCount: 20,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
