import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/presentation/views/buyer/widgets/clinic_card.dart';
import 'package:flutter/material.dart';

class ClinicRecommendationView extends StatefulWidget {
  const ClinicRecommendationView({super.key});

  @override
  State<ClinicRecommendationView> createState() =>
      _ClinicRecommendationViewState();
}

class _ClinicRecommendationViewState extends State<ClinicRecommendationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackAppBar(
        title: 'Nearby Clinics',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [Spacing.height(26.0), ClinicCard()],
        ),
      ),
    );
  }
}
