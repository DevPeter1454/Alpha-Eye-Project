import 'dart:developer';

import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/presentation/views/buyer/scan_detail/scan_details.dart';
import 'package:alpha_eye/presentation/views/buyer/widgets/scan_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../data/data.dart';
import '../../../bloc/scan/scan_bloc.dart';

class RecentScanView extends StatefulHookWidget {
  const RecentScanView({super.key});

  @override
  State<RecentScanView> createState() => _RecentScanViewState();
}

class _RecentScanViewState extends State<RecentScanView> {
  @override
  void initState() {
    scanBloc.add(GetScanHistoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scans = useState(<ScanResponse>[]);
    return BlocConsumer(
      bloc: scanBloc,
      listener: (context, state) {
        if (state is ScanError) {
          log(state.error);
          snackBars.error(message: state.error);
        }
        if (state is GetScanHistorySuccess) {
          scans.value = state.scanHistory;
          log(scans.value[0].scan!.scanId.toString());
        }
      },
      builder: (context, state) {
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
                          navigationService
                              .push(ScanDetailView(scans.value[index]));
                        },
                        child: ScanCard(
                          title: scans.value[index].scan?.scanId ?? '',
                          date:
                              '${scans.value[index].scan?.createdAt!.day}/${scans.value[index].scan?.createdAt!.month}/${scans.value[index].scan?.createdAt!.year}',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Spacing.height(16);
                    },
                    itemCount: scans.value.length,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
