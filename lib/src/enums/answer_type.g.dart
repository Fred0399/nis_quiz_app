// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnswerTypeAdapter extends TypeAdapter<AnswerType> {
  @override
  final int typeId = 1;

  @override
  AnswerType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AnswerType.Correct;
      case 1:
        return AnswerType.Wrong;
      case 2:
        return AnswerType.UnAnswered;
      default:
        return AnswerType.Correct;
    }
  }

  @override
  void write(BinaryWriter writer, AnswerType obj) {
    switch (obj) {
      case AnswerType.Correct:
        writer.writeByte(0);
        break;
      case AnswerType.Wrong:
        writer.writeByte(1);
        break;
      case AnswerType.UnAnswered:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnswerTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
