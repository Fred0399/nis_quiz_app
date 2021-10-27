import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';

part 'favorites_list_event.dart';
part 'favorites_list_state.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  FavoritesListBloc() : super(FavoritesListInitial());

  Map<String, dynamic> checkIfFavved(List<TestModel>? _questList, int? id) {
    for (int i = 0; i < _questList!.length; i++) {
      if (id == _questList[i].id) {
        return {"is_fav": true, "index": i};
      }
    }
    return {"is_fav": false, "index": -1};
  }

  @override
  Stream<FavoritesListState> mapEventToState(FavoritesListEvent event) async* {
    try {
      var box = Hive.box<List>("fav_quests");
      List<TestModel>? _favvedQuests =
          box.get("favs", defaultValue: <TestModel>[])!.cast<TestModel>();
      if (event is CheckIsFav) {
        //
        if (checkIfFavved(_favvedQuests, event.id)['is_fav']) {
          yield IsFavorite();
        } else {
          yield IsUnFavorite();
        }
      } else if (event is FavQuestion) {
        //
        final Map<String, dynamic> _tmp =
            checkIfFavved(_favvedQuests, event.testData!.id);
        if (_tmp['is_fav']) {
          // UnFav Question
          _favvedQuests.removeAt(_tmp['index']);
          // remove from local storage
          box.put("favs", _favvedQuests);
          yield IsUnFavorite();
        } else {
          // Fav Question
          AnswerType _anss = event.testData!.answerType;
          event.testData!.setAnswerType(AnswerType.UnAnswered);
          // add to local storage
          _favvedQuests.add(event.testData!);
          box.put("favs", _favvedQuests);

          yield IsFavorite();
          event.testData!.setAnswerType(_anss);
        }
      }
    } catch (e) {
      //
    }
  }
}
