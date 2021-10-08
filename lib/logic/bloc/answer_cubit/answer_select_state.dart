part of 'answer_select_cubit.dart';

abstract class AnswerSelectState extends Equatable {
  const AnswerSelectState();

  @override
  List<Object> get props => [];
}

class AnswerSelectInitial extends AnswerSelectState {}

class AnswerSelectSucc extends AnswerSelectState {
  final Map<String, AnswerType> map;

  const AnswerSelectSucc(this.map);

  @override
  List<Object> get props => [map];
}
