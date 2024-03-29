import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';

import 'question_tile.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305.w,
      child: BlocBuilder<QuestionListBlocBloc, QuestionListBlocState>(
        builder: (context, state) {
          int _itmCount =
              context.read<QuestionListBlocBloc>().questionsList.length;
          int? _selectedInd;

          if (state is QuestionSelectedSuccess) {
            _selectedInd = state.index;
          }

          return Padding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 10.h),
            child: ListView.separated(
              clipBehavior: Clip.none,
              primary: false,
              shrinkWrap: true,
              itemCount: _itmCount,
              itemBuilder: (ctxx, numm) {
                return QuestionTile(
                  questNum: numm,
                  questDesc:
                      context.read<QuestionListBlocBloc>().getQuestDesc(numm),
                  borderStyle: _selectedInd == numm
                      ? BorderStyle.solid
                      : BorderStyle.none,
                  answerType:
                      context.read<QuestionListBlocBloc>().getAnswerType(numm),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.h);
              },
            ),
          );
        },
      ),
    );
  }
}
