import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/logic/data/models/score_model.dart';
import 'package:nis_q_bank/src/dialog/local_widgets/unordered_text_item.dart';
import 'package:nis_q_bank/src/theme/colors.dart';
import 'package:provider/src/provider.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// opening About dialog
void openAboutDialog(BuildContext context) {
  CustomDialog.showAlertCustom(
    context,
    title: "About",
    onPressed: Navigator.of(context).pop,
    btnText: "CLOSE",
    content: [
      RichText(
        text: TextSpan(
          text:
              "Welcome to NIS Qbank. Here you will find boards style questions, carefully and deliberately crafted to help guide studying and promote knowledge retention specifically for the ABR Core exam. Do not lose free points by missing high yield NIS questions. Instead, engage in active learning and boost your recall for NIS-related trivia using NIS QBank. This app features:\n\n",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: CustomColors.topicNameColor,
          ),
          children: [
            WidgetSpan(
              child: UnorderedListItem(
                  "400+ high yield questions pointing you to areas that are particularly testable within ___"),
            ),
            WidgetSpan(
              child: UnorderedListItem(
                  "Content guided by the ABR Core curriculum and sourced directly from the same documents as the exam"),
            ),
            WidgetSpan(
              child: UnorderedListItem(
                  "Content meticulously updated to reflect the latest NIS guidelines and newest versions of relevant documents"),
            ),
            WidgetSpan(
              child: UnorderedListItem(
                  "Simple interface with no required login or collection of personal user data"),
            ),
            WidgetSpan(
              child: UnorderedListItem(
                  "Nonrandom question sets to keep track of progress and random sets to test recall skills"),
            ),
          ],
        ),
      )
    ],
  );
}

// opening Contact dialog
void openContactDialog(BuildContext context) {
  // function to copy email
  void _copyEmail() {
    Clipboard.setData(
      const ClipboardData(text: "NIS.QBank@gmail.com"),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Email copied to clipboard!"),
        duration: Duration(milliseconds: 350),
      ),
    );
  }

  CustomDialog.showAlertCustom(
    context,
    title: "Contact",
    onPressed: _copyEmail,
    btnText: "COPY EMAIL",
    content: [
      RichText(
        text: TextSpan(
          text:
              "For institutional access as well as any questions, concerns or feedback, please contact:\n\n",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: CustomColors.topicNameColor,
          ),
          children: [
            TextSpan(
              text: "NIS.QBank@gmail.com",
              recognizer: TapGestureRecognizer()..onTap = _copyEmail,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.iconColor,
              ),
            ),
          ],
        ),
      )
    ],
  );
}

// open scores dialog
void openScoreDialog(BuildContext context) {
  ScoreModel _scoreModel =
      context.read<QuestionListBlocBloc>().calculateScore();

  CustomDialog.showAlertCustom(
    context,
    title: "Your score",
    onPressed: Navigator.of(context).pop,
    btnText: "CLOSE",
    content: [
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: "Total questions: ${_scoreModel.getTotal}",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: CustomColors.topicNameColor,
          ),
        ),
      ),
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: "Answered correct: ",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: CustomColors.topicNameColor,
          ),
          children: [
            TextSpan(
              text: "${_scoreModel.correct}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.correctAnswerBCKColor,
              ),
            ),
          ],
        ),
      ),
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: "Answered wrong: ",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: CustomColors.topicNameColor,
          ),
          children: [
            TextSpan(
              text: "${_scoreModel.wrong}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.wrongAnswerBCKColor,
              ),
            ),
          ],
        ),
      ),
      RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          text: "Unanswered: ",
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: CustomColors.topicNameColor,
          ),
          children: [
            TextSpan(
              text: "${_scoreModel.unanswered}",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: CustomColors.topicNameColor,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 15.h),
      PieChart(
        dataMap: {
          "Correct": (_scoreModel.correct! * 100 / _scoreModel.getTotal),
          "Wrong": (_scoreModel.wrong! * 100 / _scoreModel.getTotal),
          "Unanswered": (_scoreModel.unanswered! * 100 / _scoreModel.getTotal),
        },
        animationDuration: const Duration(milliseconds: 700),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 2.8,
        colorList: const [
          CustomColors.correctAnswerBCKColor,
          CustomColors.wrongAnswerBCKColor,
          CustomColors.topicNameColor,
        ],
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        ringStrokeWidth: 5,
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.bottom,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendTextStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: CustomColors.topicNameColor,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
          chartValueBackgroundColor: Colors.black45,
          chartValueStyle: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: CustomColors.appBarTextColor,
          ),
        ),
      )
    ],
  );
}

class CustomDialog {
  static var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    //isOverlayTapDismiss: true,

    descStyle: const TextStyle(fontWeight: FontWeight.bold),
    animationDuration: const Duration(milliseconds: 300),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
  );

  static void showAlertCustom(
    BuildContext dialogContext, {
    String? title,
    required List<Widget>? content,
    Function()? onPressed,
    String? btnText = "CLOSE",
  }) {
    Alert(
      context: dialogContext,
      style: alertStyle,
      title: title,
      content: SizedBox(
        width: MediaQuery.of(dialogContext).size.width * 90 / 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: content!,
        ),
      ),
      buttons: [
        DialogButton(
          onPressed: onPressed,
          child: Text(
            btnText!,
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ),
        )
      ],
    ).show();
  }
}
