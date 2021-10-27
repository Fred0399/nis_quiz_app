part of 'favorites_list_bloc.dart';

abstract class FavoritesListState extends Equatable {
  const FavoritesListState();

  @override
  List<Object> get props => [];
}

class FavoritesListInitial extends FavoritesListState {}

class IsFavorite extends FavoritesListState {}

class IsUnFavorite extends FavoritesListState {}
