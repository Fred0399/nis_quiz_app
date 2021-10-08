import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';

part 'question_list_bloc_event.dart';
part 'question_list_bloc_state.dart';

class QuestionListBlocBloc
    extends Bloc<QuestionListBlocEvent, QuestionListBlocState> {
  final List<TestModel?> _questionList;
  final List<AnswerType> _questAnswers = [];

  int? _lastQuestInd = 0;

  List<AnswerType> get questAnswers => _questAnswers;

  List<TestModel?> get questionsList => _questionList;

  AnswerType getAnswerType(int ind) => questAnswers[ind];

  void answerCheck(bool isCorr) {
    questAnswers[_lastQuestInd!] =
        isCorr ? AnswerType.Correct : AnswerType.Wrong;
  }

  QuestionListBlocBloc(this._questionList)
      : super(QuestionListBlocInitial(_questionList)) {
    for (var i = 0; i < _questionList.length; i++) {
      _questAnswers.add(AnswerType.UnAnswered);
    }
  }

  @override
  Stream<QuestionListBlocState> mapEventToState(
      QuestionListBlocEvent event) async* {
    if (_questionList.isEmpty) return;

    if (event is QuestionSelect) {
      // Question select event will go there
      // select 1st (0) element of _questionsList
      yield QuestionSelectedSuccess(
        index: event.index,
        testModel: _questionList[event.index!],
      );
      _lastQuestInd = event.index;
    } else if (event is NextQuestionSelect) {
      // reached the last question
      if (_lastQuestInd == _questionList.length - 1) return;
      _lastQuestInd = _lastQuestInd! + 1;

      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
      );
    } else if (event is PreviousQuestionSelect) {
      // reached the first question
      if (_lastQuestInd == 0) return;
      _lastQuestInd = _lastQuestInd! - 1;

      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
      );
    }
  }
}
