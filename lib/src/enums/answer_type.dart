// ignore_for_file: constant_identifier_names
import 'package:hive/hive.dart';
part 'answer_type.g.dart';

@HiveType(typeId: 1)
enum AnswerType {
  @HiveField(0)
  Correct,
  @HiveField(1)
  Wrong,
  @HiveField(2)
  UnAnswered
}
