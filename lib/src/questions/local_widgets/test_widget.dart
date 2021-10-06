import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/src/questions/local_widgets/test_answer.dart';
import '../../theme/Colors.dart';
import 'test_image.dart';

class Test extends StatelessWidget {
  final TestModel? testData;
  final int? questNumb;

  Test({
    Key? key,
    this.testData,
    this.questNumb,
  }) : super(key: key);

  final Widget _spacer10 = SizedBox(height: 12.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      margin: EdgeInsets.only(bottom: 15.h),
      padding: EdgeInsets.only(bottom: 13.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: CustomColors.appBarTextColor,
        boxShadow: [
          BoxShadow(
            color: CustomColors.appBarTextColor,
            blurRadius: 12.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        children: [
          // if there is an image
          if (testData!.imgUrl!.isNotEmpty)
            TestImage(
              imageURL: testData!.imgUrl!,
            ),
          SizedBox(height: 10.h),
          // Question body
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$questNumb. " + testData!.desc!,
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.6.h,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.topicNameColor,
                  ),
                ),
                if (testData!.a!.isNotEmpty) ...[
                  _spacer10,
                  AnswerWidget(
                    ansVariant: "A",
                    corrAns: testData!.corrAns,
                    answerDesc: testData!.a!,
                  ),
                  _spacer10,
                ],
                if (testData!.b!.isNotEmpty) ...[
                  AnswerWidget(
                    ansVariant: "B",
                    corrAns: testData!.corrAns,
                    answerDesc: testData!.b!,
                  ),
                  _spacer10
                ],
                if (testData!.c!.isNotEmpty) ...[
                  AnswerWidget(
                    ansVariant: "C",
                    corrAns: testData!.corrAns,
                    answerDesc: testData!.c!,
                  ),
                  _spacer10
                ],
                if (testData!.d!.isNotEmpty) ...[
                  AnswerWidget(
                    ansVariant: "D",
                    corrAns: testData!.corrAns,
                    answerDesc: testData!.d!,
                  ),
                  _spacer10
                ],
                if (testData!.e!.isNotEmpty) ...[
                  AnswerWidget(
                    ansVariant: "E",
                    corrAns: testData!.corrAns,
                    answerDesc: testData!.e!,
                  ),
                  _spacer10
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
