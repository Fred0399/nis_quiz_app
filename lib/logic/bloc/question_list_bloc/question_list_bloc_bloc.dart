import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nis_q_bank/logic/data/models/score_model.dart';
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

  String? getQuestDesc(int ind) => _questionList[ind]!.desc;

  void answerCheck(bool isCorr) {
    // if already answered then do nothing
    if (questAnswers[_lastQuestInd!] != AnswerType.UnAnswered) return;

    questAnswers[_lastQuestInd!] =
        isCorr ? AnswerType.Correct : AnswerType.Wrong;
  }

  ScoreModel calculateScore() {
    int _wrongCount = 0;
    int _corrCount = 0;
    int _unAnsCount = 0;

    for (int i = 0; i < _questAnswers.length; i++) {
      if (_questAnswers[i] == AnswerType.Wrong) {
        _wrongCount += 1;
      } else if (_questAnswers[i] == AnswerType.Correct) {
        _corrCount += 1;
      } else {
        _unAnsCount += 1;
      }
    }

    return ScoreModel(
      wrong: _wrongCount,
      correct: _corrCount,
      unanswered: _unAnsCount,
    );
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
        questListLength: _questionList.length,
      );
      _lastQuestInd = event.index;
    } else if (event is NextQuestionSelect) {
      // reached the last question
      if (_lastQuestInd == _questionList.length - 1) return;
      _lastQuestInd = _lastQuestInd! + 1;

      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
        questListLength: _questionList.length,
      );
    } else if (event is PreviousQuestionSelect) {
      // reached the first question
      if (_lastQuestInd == 0) return;
      _lastQuestInd = _lastQuestInd! - 1;

      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
        questListLength: _questionList.length,
      );
    }
  }
}
