part of 'question_list_bloc_bloc.dart';

abstract class QuestionListBlocEvent extends Equatable {
  const QuestionListBlocEvent();

  @override
  List<Object> get props => [];
}

class QuestionSelect extends QuestionListBlocEvent {
  final int? id;
  final int? index;

  const QuestionSelect({this.id, this.index});
}

class NextQuestionSelect extends QuestionListBlocEvent {}

class PreviousQuestionSelect extends QuestionListBlocEvent {}

class CurrentQuestionSelect extends QuestionListBlocEvent {}
