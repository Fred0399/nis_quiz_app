import 'package:flutter/material.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionNumNav extends StatelessWidget {
  /// if isPrev is true, that means that's the button to move previous question
  /// otherwise it is the button for next one
  final bool? isPrev;
  final Function()? onTap;

  const QuestionNumNav({Key? key, this.onTap, this.isPrev = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isPrev == true)
              Icon(
                Icons.arrow_left_rounded,
                color: CustomColors.appBarColor,
                size: 24.r,
              ),
            Text(
              (isPrev == true) ? "Previous" : "Next",
              style: TextStyle(
                height: 1.6.h,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.topicNameColor,
              ),
            ),
            if (isPrev == false)
              Icon(
                Icons.arrow_right_rounded,
                color: CustomColors.appBarColor,
                size: 24.r,
              ),
          ],
        ),
      ),
    );
  }
}
