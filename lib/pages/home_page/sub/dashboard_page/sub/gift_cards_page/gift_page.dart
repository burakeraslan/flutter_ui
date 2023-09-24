import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/custom_app_bar.dart';
import 'package:flutter_ui/widgets/custom_back_button.dart';
import 'package:flutter_ui/widgets/custom_header.dart';
import 'package:flutter_ui/widgets/custom_notification_button.dart';

class GiftPage extends StatelessWidget {
  const GiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFEEEEEE),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // App Bar
                CustomAppBar(
                  firstWidget: CustomBackButton(),
                  headerWidget: CustomHeader(
                    header: 'Gift',
                    size: 22,
                  ),
                  notificationWidget: CustomNotificationButton(),
                ),
              ],
            ),
          )),
    );
  }
}
