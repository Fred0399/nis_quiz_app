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

  void fetchTopics() async {
    emit(TopicsLoading());

    List<TopicModel> _topics = [];
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

        late TopicModel _yp =
            TopicModel(key, key, _questions.length, _questions);

        _topics.add(_yp);
      });

      emit(TopicsSuccess(_topics));
    } catch (e) {
      emit(TopicsError("Error occured in data fetch, please refresh"));
    }
  }
}
