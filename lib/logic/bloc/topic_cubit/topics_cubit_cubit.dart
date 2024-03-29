import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/logic/data/models/topic_model.dart';

part 'topics_cubit_state.dart';

class TopicsCubitCubit extends Cubit<TopicsCubitState> {
  TopicsCubitCubit() : super(TopicsCubitInitial());

  final databaseRef = FirebaseDatabase.instance.reference();
  // ignore: unused_field
  final Future<FirebaseApp> _future = Firebase.initializeApp();

  // topics
  List<TopicModel> _topics = [];
  // store random questions
  List<TestModel> _randomQuestions = [];

  void fetchTopics([bool showLoading = true]) async {
    if (showLoading) {
      emit(TopicsLoading());
    }

    // reset topics values
    _topics.clear();
    _randomQuestions.clear();

    try {
      DataSnapshot dataSnapshot = await databaseRef.once();

      final LinkedHashMap _hMap = dataSnapshot.value;

      _hMap.forEach((key, value) {
        List<TestModel> _questions = [];
        List vll = value as List;

        for (var item in vll) {
          if (item != null && item != Null) {
            _questions.add(TestModel.fromJson(Map.from(item)));
          }
        }

        // choose 1 element from each topic being random based
        if (_questions.isNotEmpty) {
          int _rand = Random().nextInt(_questions.length);
          _randomQuestions.add(_questions[_rand]);
        }

        _topics.add(TopicModel(key, key, _questions.length, _questions));
      });

      // Generating a random Topic
      _topics.add(
        TopicModel(
          "Random",
          "Random",
          _randomQuestions.length,
          _randomQuestions,
          isRandom: true,
        ),
      );

      emit(TopicsSuccess(_topics));
    } catch (e) {
      emit(TopicsError("Error occured in data fetch, please refresh"));
    }
  }

  List<TestModel> get getRandomQuestions {
    //reset randoms list
    _randomQuestions.clear();

    // as the last topic itself is random
    for (int i = 0; i < _topics.length - 1; i++) {
      if (_topics[i].questionsList!.isNotEmpty) {
        int _rand = Random().nextInt(_topics[i].questionsList!.length);
        _randomQuestions.add(_topics[i].questionsList![_rand]);
      }
    }
    _randomQuestions.shuffle();

    return _randomQuestions;
  }
}
