import 'package:flutter/material.dart';
import 'package:nis_q_bank/logic/bloc/answer_cubit/answer_select_cubit.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';
import 'package:nis_q_bank/src/theme/Colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerWidget extends StatelessWidget {
  final String? corrAns;
  final String? ansVariant;
  final String? answerDesc;
  final String? corrAnsDesc;
  final int? indx;
  final AnswerType? answerType;

  AnswerWidget({
    Key? key,
    this.corrAns = "",
    this.ansVariant = "",
    this.answerDesc = "",
    this.corrAnsDesc,
    required this.indx,
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
      onTap: () {
        context.read<AnswerSelectCubit>().selectAnswer(
              index: indx,
              selectedOpt: ansVariant,
              correctOpt: corrAns,
            );
        context.read<QuestionListBlocBloc>().answerCheck(ansVariant == corrAns);
      },
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
          maxLines: 30,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
              ),
              TextSpan(text: answerDesc!),
              if (answerType == AnswerType.Correct) ...[
                TextSpan(
                  text: "\n\nExplanation: ",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
                ),
                TextSpan(
                  text: corrAnsDesc,
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
