import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/src/dialog/contact_us.dart';
import 'package:nis_q_bank/src/theme/Colors.dart';
import 'package:nis_q_bank/src/topics/local_widgets/appbar_action_icon.dart';

import 'local_widgets/controller_row.dart';
import 'local_widgets/questions_grid_view.dart';
import 'local_widgets/test_widget.dart';

class QuestionScreen extends StatelessWidget {
  final String topicName;
  const QuestionScreen({Key? key, this.topicName = "NIS Qbank"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_sharp,
            size: 34.r,
            color: CustomColors.appBarTextColor,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        actions: [
          AppBarActionIcon(
              icon: Icons.mail_outline_rounded,
              onPressed: () {
                openContactDialog(context);
              }),
        ],
        title: Text(topicName),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            child: Column(
              children: [
                // Question widget
                BlocBuilder<QuestionListBlocBloc, QuestionListBlocState>(
                  builder: (BuildContext context, blocState) {
                    if (blocState is QuestionSelectedSuccess) {
                      return Test(
                        questNumb: blocState.index! + 1,
                        testData: blocState.testModel,
                      );
                    }
                    return const SizedBox();
                  },
                ),

                SizedBox(height: 10.h),
                // Open / Close question and move next
                const ControllerRow(),
                SizedBox(height: 15.h),
                // Questions list widget
                const QuestionsGridView(),
                SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
