// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestModelAdapter extends TypeAdapter<TestModel> {
  @override
  final int typeId = 0;

  @override
  TestModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestModel(
      a: fields[0] as String?,
      b: fields[1] as String?,
      c: fields[2] as String?,
      d: fields[3] as String?,
      e: fields[4] as String?,
      ansDesc: fields[5] as String?,
      corrAns: fields[6] as String?,
      desc: fields[7] as String?,
      id: fields[8] as int?,
      imgUrl: fields[9] as String?,
    ).._answerType = fields[10] as AnswerType;
  }

  @override
  void write(BinaryWriter writer, TestModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.a)
      ..writeByte(1)
      ..write(obj.b)
      ..writeByte(2)
      ..write(obj.c)
      ..writeByte(3)
      ..write(obj.d)
      ..writeByte(4)
      ..write(obj.e)
      ..writeByte(5)
      ..write(obj.ansDesc)
      ..writeByte(6)
      ..write(obj.corrAns)
      ..writeByte(7)
      ..write(obj.desc)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.imgUrl)
      ..writeByte(10)
      ..write(obj._answerType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
