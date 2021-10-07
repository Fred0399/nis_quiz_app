import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';
import 'package:nis_q_bank/src/theme/colors.dart';

// ignore: must_be_immutable
class QuestionBox extends StatelessWidget {
  final int? questNum;
  final AnswerType? answerType;
  final BorderStyle? borderStyle;

  QuestionBox({
    Key? key,
    this.questNum = 0,
    this.answerType = AnswerType.UnAnswered,
    this.borderStyle = BorderStyle.solid,
  }) : super(key: key);

  late Color _bckgroundColor;

  @override
  Widget build(BuildContext context) {
    if (answerType == AnswerType.Wrong) {
      _bckgroundColor = CustomColors.wrongAnswerBCKColor;
    } else if (answerType == AnswerType.Correct) {
      _bckgroundColor = CustomColors.correctAnswerBCKColor;
    } else {
      _bckgroundColor = CustomColors.answerBackgroundColor;
    }
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        print("QUEST NUMB: $questNum");
      },
      child: Container(
        width: 33.r,
        height: 33.r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: _bckgroundColor,
          border: Border.all(
            color: CustomColors.iconColor,
            width: 0.8,
            style: borderStyle!,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3.h),
              color: const Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 4.r,
            )
          ],
        ),
        child: Text(
          "${(questNum! + 1)}",
          style: TextStyle(
            height: 1.6.h,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: CustomColors.topicNameColor,
          ),
        ),
      ),
    );
  }
}
