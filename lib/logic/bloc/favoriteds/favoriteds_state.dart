part of 'favoriteds_cubit.dart';

abstract class FavoritedsState extends Equatable {
  const FavoritedsState();
}

class FavoritedsInitial extends FavoritedsState {
  @override
  List<Object?> get props => [];
}

class FavoritedsSuccess extends FavoritedsState {
  final List<TestModel> favvedTests;

  const FavoritedsSuccess(this.favvedTests);

  @override
  List<Object?> get props => [favvedTests];
}

class FavoritedsFailure extends FavoritedsState {
  final String? errMessage;

  const FavoritedsFailure(this.errMessage);

  @override
  List<Object?> get props => [errMessage];
}
