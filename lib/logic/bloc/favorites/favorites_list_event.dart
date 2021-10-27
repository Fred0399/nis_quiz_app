part of 'favorites_list_bloc.dart';

abstract class FavoritesListEvent extends Equatable {
  const FavoritesListEvent();

  @override
  List<Object> get props => [];
}

class FavQuestion extends FavoritesListEvent {
  final TestModel? testData;

  const FavQuestion({this.testData});
}

class CheckIsFav extends FavoritesListEvent {
  final int? id;

  const CheckIsFav({required this.id});
}
