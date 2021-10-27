import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/src/dialog/custom_dialog.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:nis_q_bank/src/topics/local_widgets/appbar_action_icon.dart';

import 'local_widgets/controller_row.dart';
import 'local_widgets/questions_list_view.dart';
import 'local_widgets/test_widget.dart';

class QuestionScreen extends StatefulWidget {
  final String topicName;
  final bool? isFavScreen;
  const QuestionScreen(
      {Key? key, this.topicName = "NIS Qbank", this.isFavScreen = false})
      : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ColoredBox(
          color: CustomColors.bckgrndColor,
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Questions list",
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: CustomColors.topicNameColor,
                    ),
                  ),
                  const QuestionsListView()
                ],
              ),
            ),
          ),
        ),
      ),
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
        title: Text(widget.topicName),
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
                        isInFavScreen: widget.isFavScreen,
                      );
                    } else if (blocState is NoQuestion) {
                      return Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "No questions favorited",
                          style: TextStyle(
                            height: 1.6.h,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: CustomColors.topicNameColor,
                          ),
                        ),
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
                // const QuestionsGridView(),
                // SizedBox(height: 15.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
