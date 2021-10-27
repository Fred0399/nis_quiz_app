// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/src/theme/colors.dart';

class UnorderedListItem extends StatelessWidget {
  final String? text;
  UnorderedListItem(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "• ",
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: CustomColors.topicNameColor,
          ),
        ),
        Expanded(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: CustomColors.topicNameColor,
            ),
          ),
        ),
      ],
    );
  }
}
