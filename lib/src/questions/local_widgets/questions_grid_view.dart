import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';

import 'question_box.dart';

class QuestionsGridView extends StatelessWidget {
  const QuestionsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305.w,
      child: GridView.builder(
        clipBehavior: Clip.none,
        primary: false,
        shrinkWrap: true,
        itemCount: 50,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 7,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.h,
        ),
        itemBuilder: (ctxx, numm) {
          late AnswerType _ansTyp = AnswerType.UnAnswered;
          if (numm % 3 == 0) {
            _ansTyp = AnswerType.Correct;
          } else if (numm % 5 == 0) {
            _ansTyp = AnswerType.Wrong;
          }
          return QuestionBox(questNum: numm, answerType: _ansTyp);
        },
      ),
    );
  }
}
