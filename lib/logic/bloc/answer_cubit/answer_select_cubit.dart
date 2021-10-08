import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';

part 'answer_select_state.dart';

class AnswerSelectCubit extends Cubit<AnswerSelectState> {
  AnswerSelectCubit() : super(AnswerSelectInitial());

  final Map<int, Map<String, AnswerType>> _answers = {};

  void setTestState(int? questIndx) {
    emit(AnswerSelectInitial());

    if (_answers.containsKey(questIndx)) {
      emit(AnswerSelectSucc(_answers[questIndx]!));
    }
  }

  void selectAnswer({int? index, String? selectedOpt, String? correctOpt}) {
    if (_answers.containsKey(index)) {
      return;
    }

    Map<String, AnswerType> _tmpMap = {};
    if (selectedOpt == correctOpt) {
      // Answered correctly
      _tmpMap.putIfAbsent(selectedOpt!, () => AnswerType.Correct);
    } else {
      // Answered wrong
      _tmpMap.putIfAbsent(selectedOpt!, () => AnswerType.Wrong);
      _tmpMap.putIfAbsent(correctOpt!, () => AnswerType.Correct);
    }

    _answers.putIfAbsent(index!, () => _tmpMap);

    emit(AnswerSelectSucc(_tmpMap));
  }
}
