import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/logic/bloc/answer_cubit/answer_select_cubit.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';
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
    context.read<AnswerSelectCubit>().setTestState(questNumb! - 1);
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
                BlocBuilder<AnswerSelectCubit, AnswerSelectState>(
                  builder: (ctxx, statee) {
                    AnswerType _A = AnswerType.UnAnswered;
                    AnswerType _B = AnswerType.UnAnswered;
                    AnswerType _C = AnswerType.UnAnswered;
                    AnswerType _D = AnswerType.UnAnswered;
                    AnswerType _E = AnswerType.UnAnswered;

                    if (statee is AnswerSelectSucc) {
                      statee.map.forEach((key, value) {
                        if (key == 'A') {
                          _A = value;
                        }
                        if (key == 'B') {
                          _B = value;
                        }
                        if (key == 'C') {
                          _C = value;
                        }
                        if (key == 'D') {
                          _D = value;
                        }
                        if (key == 'E') {
                          _E = value;
                        }
                      });
                    }

                    return Column(
                      children: [
                        if (testData!.a!.isNotEmpty) ...[
                          _spacer10,
                          AnswerWidget(
                            ansVariant: "A",
                            corrAns: testData!.corrAns,
                            answerDesc: testData!.a!,
                            corrAnsDesc: testData!.ansDesc,
                            answerType: _A,
                            indx: questNumb! - 1,
                          ),
                          _spacer10,
                        ],
                        if (testData!.b!.isNotEmpty) ...[
                          AnswerWidget(
                            ansVariant: "B",
                            corrAns: testData!.corrAns,
                            answerDesc: testData!.b!,
                            corrAnsDesc: testData!.ansDesc,
                            answerType: _B,
                            indx: questNumb! - 1,
                          ),
                          _spacer10
                        ],
                        if (testData!.c!.isNotEmpty) ...[
                          AnswerWidget(
                            ansVariant: "C",
                            corrAns: testData!.corrAns,
                            answerDesc: testData!.c!,
                            corrAnsDesc: testData!.ansDesc,
                            answerType: _C,
                            indx: questNumb! - 1,
                          ),
                          _spacer10
                        ],
                        if (testData!.d!.isNotEmpty) ...[
                          AnswerWidget(
                            ansVariant: "D",
                            corrAns: testData!.corrAns,
                            answerDesc: testData!.d!,
                            corrAnsDesc: testData!.ansDesc,
                            answerType: _D,
                            indx: questNumb! - 1,
                          ),
                          _spacer10
                        ],
                        if (testData!.e!.isNotEmpty) ...[
                          AnswerWidget(
                            ansVariant: "E",
                            corrAns: testData!.corrAns,
                            answerDesc: testData!.e!,
                            corrAnsDesc: testData!.ansDesc,
                            answerType: _E,
                            indx: questNumb! - 1,
                          ),
                          _spacer10
                        ],
                      ],
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
