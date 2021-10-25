import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quest_num_nav.dart';
import 'show_scores.dart';

class ControllerRow extends StatelessWidget {
  const ControllerRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 305.w,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Text(
              "Show all questions",
              style: TextStyle(
                height: 1.6.h,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.topicNameColor,
              ),
            ),
            onTap: () {
              // open questions list in drawer
              Scaffold.of(context).openDrawer();
            },
          ),
          Row(
            children: [
              QuestionNumNav(
                isPrev: true,
                onTap: () {
                  context
                      .read<QuestionListBlocBloc>()
                      .add(PreviousQuestionSelect());
                },
              ),
              SizedBox(width: 13.w),
              BlocBuilder<QuestionListBlocBloc, QuestionListBlocState>(
                builder: (BuildContext context, blocState) {
                  if (blocState is QuestionSelectedSuccess) {
                    // reached to the latest question of set
                    if (blocState.index == blocState.questListLength! - 1) {
                      return const ShowScore();
                    }
                  }
                  return QuestionNumNav(
                    isPrev: false,
                    onTap: () {
                      context
                          .read<QuestionListBlocBloc>()
                          .add(NextQuestionSelect());
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
