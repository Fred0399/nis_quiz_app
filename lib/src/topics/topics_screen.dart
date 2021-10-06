import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nis_q_bank/src/questions/question_screen.dart';
import 'package:nis_q_bank/src/topics/local_widgets/topic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NIS Qbank",
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            // ignore: avoid_print
            print("REFRESH");
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            child: ListView.builder(
              itemCount: 10,
              clipBehavior: Clip.none,
              itemBuilder: (ctxx, ind) {
                ind = ind + 1;
                return Topic(
                  topicName: "Topic_A Topic_A Topic_A Topic_A" * ind,
                  questCount: ind,
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (ctxx) => const QuestionScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
