import 'package:equatable/equatable.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';

class TopicModel extends Equatable {
  final String? topicName;
  final String? topicKey;
  final int? questCount;
  final List<TestModel>? _questionsList;

  const TopicModel(
      this.topicName, this.topicKey, this.questCount, this._questionsList);

  List<TestModel>? get questionsList => _questionsList;

  @override
  List<Object?> get props => [topicName, topicKey, questCount, _questionsList];
}
