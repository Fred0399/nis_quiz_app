import "package:equatable/equatable.dart";

class ScoreModel implements Equatable {
  final int? unanswered;
  final int? wrong;
  final int? correct;

  ScoreModel({this.unanswered, this.wrong, this.correct});

  int get getTotal => unanswered! + wrong! + correct!;

  @override
  List<Object?> get props => [unanswered, wrong, correct];

  @override
  bool? get stringify => throw UnimplementedError();
}
