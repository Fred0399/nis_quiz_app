// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';

// ignore: must_be_immutable
class QuestionTile extends StatelessWidget {
  final int? questNum;
  final String? questDesc;
  final AnswerType? answerType;
  final BorderStyle? borderStyle;
  QuestionTile({
    Key? key,
    this.questNum = 0,
    this.answerType = AnswerType.UnAnswered,
    this.borderStyle = BorderStyle.solid,
    this.questDesc = "",
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
        context
            .read<QuestionListBlocBloc>()
            .add(QuestionSelect(index: questNum));
      },
      child: Container(
        height: 50.h,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: _bckgroundColor,
          border: Border.all(
            color: CustomColors.iconColor,
            width: 1.2.r,
            style: borderStyle!,
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2.8.h),
              color: const Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 3.r,
            )
          ],
        ),
        child: Text(
          "${(questNum! + 1)}. $questDesc",
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
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
