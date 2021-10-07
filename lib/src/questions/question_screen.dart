import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/src/theme/Colors.dart';

import 'local_widgets/controller_row.dart';
import 'local_widgets/questions_grid_view.dart';
import 'local_widgets/test_widget.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({Key? key}) : super(key: key);

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
        title: const Text(
          "NIS Qbank",
        ),
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
                Test(
                  questNumb: 1,
                  testData: TestModel(
                    desc:
                        "Which of the following is true regarding quality improvt?" *
                            5,
                    ansDesc:
                        'The correct answer is (D) it aims to create systems that prevent errors from happening. The other answer choices (A, B, C, and E) are true about quality assurance, NOT quality improvement. Although sometimes lumped together as quality assurance/ quality improvement (QA/QI), they are temporally and ideologically unique process.  Quality improvement (QI) is a more recent phenomenon in healthcare, but many are familiar with the term Quality Assurance (QA) as it was a common term for a number of years. QA can be considered reactive, generally retrospective, occasionally involving policing, and in many ways punitive or finger pointing. It often involves determining who was at fault after a medical error. The term QA is older and not often used today (E).  The Case for Using Industrial Quality Management Science in Health Care Organizations, Laffel and Blumenthal, JAMA, 262, 20, 1989.',
                    corrAns: 'D',
                    a: 'It involves retrospective reviews only',
                    b: 'It is a static process',
                    c: 'It seeks to attribute blame through root cause analysis',
                    d: 'It aims to create systems that prevent errors from happening',
                    e: 'It is an older process than quality assurance',
                    id: 1001,
                    imgUrl: //"http://via.placeholder.com/350x150"
                        "https://drive.google.com/uc?export=view&id=1DJCVjxjDKSqHPODa0N7vRHTXzzxDOHZW",
                  ),
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
