import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nis_q_bank/logic/data/models/test_model.dart';

part 'favoriteds_state.dart';

class FavoritedsCubit extends Cubit<FavoritedsState> {
  FavoritedsCubit() : super(FavoritedsInitial());

  void getFavvedQuestions() async {
    try {
      var box = Hive.box<List>("fav_quests");
      var _list = box.get("favs", defaultValue: <TestModel>[]);

      List<TestModel>? _favvedQuests = _list!.cast<TestModel>();

      emit(FavoritedsSuccess(_favvedQuests));
    } catch (e) {
      emit(FavoritedsFailure(e.toString()));
    }
  }
}
