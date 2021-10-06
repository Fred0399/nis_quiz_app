import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nis_q_bank/src/theme/Colors.dart';

class Topic extends StatelessWidget {
  final String? topicName;
  final int? questCount;
  final Function()? onTap;
  const Topic({
    Key? key,
    this.questCount,
    this.topicName = "",
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 320.w,
        margin: EdgeInsets.only(bottom: 15.h),
        constraints: BoxConstraints(minHeight: 70.h, maxHeight: 110.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 320.w,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      topicName!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: TextStyle(
                        height: 1.5.h,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: CustomColors.topicNameColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 30.r,
                    color: CustomColors.iconColor,
                  )
                ],
              ),
            ),
            SizedBox(height: 8.h),
            ColoredBox(
              color: CustomColors.iconColor,
              child: SizedBox(
                width: double.infinity,
                height: 1.h,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Number of questions: $questCount",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: CustomColors.topicNameColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
