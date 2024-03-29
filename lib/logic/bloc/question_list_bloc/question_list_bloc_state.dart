part of 'question_list_bloc_bloc.dart';

abstract class QuestionListBlocState extends Equatable {
  const QuestionListBlocState();

  // ignore: annotate_overrides
  List<Object> get props => [];
}

class QuestionListBlocInitial extends QuestionListBlocState {
  final List<TestModel?> _questionsList;

  const QuestionListBlocInitial(this._questionsList);

  @override
  List<Object> get props => [_questionsList];
}

class QuestionSelectedSuccess extends QuestionListBlocState {
  final int? index;
  final int? questListLength;
  final TestModel? testModel;

  const QuestionSelectedSuccess({
    required this.index,
    required this.testModel,
    required this.questListLength,
  });

  @override
  List<Object> get props => [index!, testModel!, questListLength!];
}

class NoQuestion extends QuestionListBlocState {
  @override
  List<Object> get props => [];
}
