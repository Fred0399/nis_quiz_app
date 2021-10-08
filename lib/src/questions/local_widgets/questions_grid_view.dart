import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';

import 'question_box.dart';

class QuestionsGridView extends StatelessWidget {
  const QuestionsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305.w,
      child: BlocBuilder<QuestionListBlocBloc, QuestionListBlocState>(
        builder: (context, state) {
          int _itmCount =
              context.read<QuestionListBlocBloc>().questAnswers.length;
          int? _selectedInd;

          if (state is QuestionSelectedSuccess) {
            _selectedInd = state.index;
          }

          return GridView.builder(
            clipBehavior: Clip.none,
            primary: false,
            shrinkWrap: true,
            itemCount: _itmCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 10.h,
            ),
            itemBuilder: (ctxx, numm) {
              return QuestionBox(
                questNum: numm,
                borderStyle:
                    _selectedInd == numm ? BorderStyle.solid : BorderStyle.none,
                answerType:
                    context.read<QuestionListBlocBloc>().getAnswerType(numm),
              );
            },
          );
        },
      ),
    );
  }
}
