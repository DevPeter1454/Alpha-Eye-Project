import 'package:alpha_eye/core/cores.dart';
import 'package:alpha_eye/presentation/views/buyer/widgets/notification_tile.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(
        title: 'Notification',
      ),
      body: Column(
        children: [
          Expanded(
            child: AppRectangle(
              margin: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              padding: const EdgeInsets.symmetric(
                //horizontal: 16.0,
                vertical: 24.0,
              ),
              radius: 12,
              color: AppColors.white,
              // padding: EdgeInsets.symmetric(
              //   horizontal: 16.0,
              //   vertical: 24.0,
              // ),
              child: Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const NotificationTile();
                    },
                    separatorBuilder: (context, index) {
                      return const Spacing.height(16);
                    },
                    itemCount: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
