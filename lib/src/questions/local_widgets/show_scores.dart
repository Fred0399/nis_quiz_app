import 'package:flutter/material.dart';
import 'package:nis_q_bank/src/dialog/custom_dialog.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowScore extends StatelessWidget {
  /// if isPrev is true, that means that's the button to move previous question
  /// otherwise it is the button for next one

  const ShowScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        openScoreDialog(context);
      },
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Show score",
              style: TextStyle(
                height: 1.6.h,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.topicNameColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
