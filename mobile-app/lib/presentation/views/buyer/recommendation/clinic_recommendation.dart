import 'dart:developer';

import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/data/models/responses/hospital_response.dart';
import 'package:alpha_eye/presentation/bloc/scan/scan_bloc.dart';
import 'package:alpha_eye/presentation/views/buyer/widgets/clinic_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ClinicRecommendationView extends StatefulHookWidget {
  const ClinicRecommendationView({super.key});

  @override
  State<ClinicRecommendationView> createState() =>
      _ClinicRecommendationViewState();
}

class _ClinicRecommendationViewState extends State<ClinicRecommendationView> {
  @override
  void initState() {
    scanBloc.add(GetHospitalByStateEvent(state: 'Oyo'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final hospitalDetails = useState(<HospitalResponse>[]);
    final loading = useState(true);
    return BlocConsumer(
      bloc: scanBloc,
      listener: (context, state) {
        if (state is ScanError) {
          log(state.error);
          snackBars.error(message: state.error);
          loading.value = false;
        }
        if (state is GetHospitalByStateSuccess) {
          loading.value = false;
          hospitalDetails.value = state.hospitals;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const BackAppBar(
            title: 'Nearby Clinics',
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacing.height(26.0),
                loading.value == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ClinicCard(
                                hospitalResponse: hospitalDetails.value[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Spacing.height(16.0);
                          },
                          itemCount: hospitalDetails.value.length,
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
