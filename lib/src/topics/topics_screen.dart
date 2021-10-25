import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nis_q_bank/logic/bloc/answer_cubit/answer_select_cubit.dart';
import 'package:nis_q_bank/logic/bloc/question_list_bloc/question_list_bloc_bloc.dart';
import 'package:nis_q_bank/logic/bloc/topic_cubit/topics_cubit_cubit.dart';
import 'package:nis_q_bank/src/questions/question_screen.dart';
import 'package:nis_q_bank/src/topics/local_widgets/appbar_action_icon.dart';
import 'package:nis_q_bank/src/topics/local_widgets/topic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../dialog/contact_us.dart';

class TopicsScreen extends StatelessWidget {
  TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NIS Qbank",
        ),
        actions: [
          AppBarActionIcon(
              icon: Icons.mail_outline_rounded,
              onPressed: () {
                openContactDialog(context);
              }),
          AppBarActionIcon(
              icon: Icons.info_outline_rounded,
              onPressed: () {
                openAboutDialog(context);
              }),
        ],
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<TopicsCubitCubit>().fetchTopics();
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
            child: BlocBuilder<TopicsCubitCubit, TopicsCubitState>(
              builder: (context, state) {
                if (state is TopicsSuccess) {
                  return ListView.builder(
                    itemCount: state.topics.length,
                    clipBehavior: Clip.none,
                    itemBuilder: (ctxx, ind) {
                      return Topic(
                        topicName: state.topics[ind].topicName,
                        questCount: state.topics[ind].questCount,
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (ctxx) =>
                                  BlocProvider<QuestionListBlocBloc>(
                                create: (ctxxx) => QuestionListBlocBloc(
                                  state.topics[ind].questionsList!,
                                )..add(const QuestionSelect(index: 0)),
                                child: BlocProvider<AnswerSelectCubit>(
                                  create: (context) => AnswerSelectCubit(),
                                  child: QuestionScreen(
                                    topicName: state.topics[ind].topicName!,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else if (state is TopicsLoading) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 30.r,
                      width: 30.r,
                      child: const CircularProgressIndicator(strokeWidth: 3.0),
                    ),
                  );
                } else if (state is TopicsError) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Text(state.errMessage!),
                  );
                }
                return const SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
