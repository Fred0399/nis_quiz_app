import 'package:flutter/material.dart';
import 'package:nis_q_bank/src/dialog/custom_dialog.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/src/topics/local_widgets/appbar_action_icon.dart';

class EmptyScreen extends StatelessWidget {
  final String? topicName;
  const EmptyScreen({Key? key, this.topicName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_sharp,
            size: 34.r,
            color: CustomColors.appBarTextColor,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          AppBarActionIcon(
              icon: Icons.mail_outline_rounded,
              onPressed: () {
                openContactDialog(context);
              }),
          AppBarActionIcon(
              icon: Icons.info_outline_rounded,
              onPressed: () {
                openAboutDialog(context);
              }),
        ],
        title: Text(topicName!),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              "No questions favorited",
              style: TextStyle(
                height: 1.6.h,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: CustomColors.topicNameColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
