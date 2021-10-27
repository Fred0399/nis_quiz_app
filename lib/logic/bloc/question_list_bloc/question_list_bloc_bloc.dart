import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nis_q_bank/logic/data/models/score_model.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';

part 'question_list_bloc_event.dart';
part 'question_list_bloc_state.dart';

class QuestionListBlocBloc
    extends Bloc<QuestionListBlocEvent, QuestionListBlocState> {
  final Function(int? id)? checkIsFav;
  final List<TestModel?> _questionList;

  int? _lastQuestInd = 0;

  List<TestModel?> get questionsList => _questionList;

  AnswerType getAnswerType(int ind) => _questionList[ind]!.answerType;

  String? getQuestDesc(int ind) => _questionList[ind]!.desc;

  void answerCheck(bool isCorr) {
    // if already answered then do nothing
    if (_questionList[_lastQuestInd!]!.answerType != AnswerType.UnAnswered) {
      return;
    }

    _questionList[_lastQuestInd!]!
        .setAnswerType(isCorr ? AnswerType.Correct : AnswerType.Wrong);
  }

  ScoreModel calculateScore() {
    int _wrongCount = 0;
    int _corrCount = 0;
    int _unAnsCount = 0;

    for (int i = 0; i < _questionList.length; i++) {
      if (_questionList[i]!.answerType == AnswerType.Wrong) {
        _wrongCount += 1;
      } else if (_questionList[i]!.answerType == AnswerType.Correct) {
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

  QuestionListBlocBloc(this._questionList, {required this.checkIsFav})
      : super(QuestionListBlocInitial(_questionList)) {
    // reset answer types
    for (var i = 0; i < _questionList.length; i++) {
      _questionList[i]!.setAnswerType(AnswerType.UnAnswered);
    }
  }

  @override
  Stream<QuestionListBlocState> mapEventToState(
      QuestionListBlocEvent event) async* {
    if (_questionList.isEmpty) {
      yield NoQuestion();
      return;
    }

    if (event is QuestionSelect) {
      // Question select event will go there
      // check if question was favved
      checkIsFav!(_questionList[event.index!]!.id);
      // select 1st (0) element of _questionsList
      yield QuestionSelectedSuccess(
        index: event.index,
        testModel: _questionList[event.index!],
        questListLength: _questionList.length,
      );
      _lastQuestInd = event.index;
    } else if (event is NextQuestionSelect) {
      // reached the last question
      if (_lastQuestInd! >= _questionList.length - 1) {
        _lastQuestInd = _questionList.length - 1;
      } else {
        _lastQuestInd = _lastQuestInd! + 1;
      }

      // check if question was favved
      checkIsFav!(_questionList[_lastQuestInd!]!.id);
      //
      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
        questListLength: _questionList.length,
      );
    } else if (event is PreviousQuestionSelect) {
      // reached the first question
      if (_lastQuestInd == 0) return;
      _lastQuestInd = _lastQuestInd! - 1;
      // check if question was favved
      checkIsFav!(_questionList[_lastQuestInd!]!.id);
      //
      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
        questListLength: _questionList.length,
      );
    } else if (event is CurrentQuestionSelect) {
      if (_lastQuestInd! > _questionList.length - 1) {
        _lastQuestInd = _questionList.length - 1;
      }
      // check if question was favved
      checkIsFav!(_questionList[_lastQuestInd!]!.id);
      //
      yield QuestionSelectedSuccess(
        index: _lastQuestInd,
        testModel: _questionList[_lastQuestInd!],
        questListLength: _questionList.length,
      );
    }
  }
}
