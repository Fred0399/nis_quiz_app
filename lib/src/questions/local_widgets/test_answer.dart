import 'package:flutter/material.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';
import 'package:nis_q_bank/src/theme/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerWidget extends StatelessWidget {
  final String? corrAns;
  final String? ansVariant;
  final String? answerDesc;
  final AnswerType? answerType;

  AnswerWidget({
    Key? key,
    this.corrAns = "",
    this.ansVariant = "",
    this.answerDesc = "",
    this.answerType = AnswerType.UnAnswered,
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
      onTap: () {},
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(minHeight: 35.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          color: _bckgroundColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 9.w,
          vertical: 15.h,
        ),
        child: RichText(
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 20,
          textAlign: TextAlign.left,
          text: TextSpan(
            style: TextStyle(
              height: 1.6.h,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: CustomColors.topicNameColor,
            ),
            children: [
              TextSpan(
                text: "${ansVariant!.toUpperCase()}. ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: answerDesc!),
            ],
          ),
        ),
      ),
    );
  }
}
