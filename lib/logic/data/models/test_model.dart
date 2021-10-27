// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nis_q_bank/src/enums/answer_type.dart';
part 'test_model.g.dart';
// TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

// String testModelToJson(TestModel data) => json.encode(data.toJson());

List<TestModel> testModelFromJson(List<dynamic> str) => List<TestModel>.from(
      str.map(
        (x) {
          if (x != null && x != Null) return TestModel.fromJson(x);
        },
      ),
    );

// String testModelToJson(List<TestModel> data) => json.encode(
//       List<dynamic>.from(
//         data.map(
//           (x) => x == null ? null : x.toJson(),
//         ),
//       ),
//     );
@HiveType(typeId: 0)
// ignore: must_be_immutable
class TestModel extends HiveObject with EquatableMixin {
  TestModel({
    this.a = '',
    this.b = '',
    this.c = '',
    this.d = '',
    this.e = '',
    required this.ansDesc,
    required this.corrAns,
    required this.desc,
    this.id,
    this.imgUrl = '',
  });

  @HiveField(0)
  String? a;
  @HiveField(1)
  String? b;
  @HiveField(2)
  String? c;
  @HiveField(3)
  String? d;
  @HiveField(4)
  String? e;
  @HiveField(5)
  String? ansDesc;
  @HiveField(6)
  String? corrAns;
  @HiveField(7)
  String? desc;
  @HiveField(8)
  int? id;
  @HiveField(9)
  String? imgUrl;

  @HiveField(10)
  AnswerType _answerType = AnswerType.UnAnswered;

  AnswerType get answerType => _answerType;

  void setAnswerType(AnswerType ans) {
    _answerType = ans;
  }

  factory TestModel.fromJson(Map<String, dynamic> json) {
    String? imgURl = "";

    if (json["img_url"] == null || json["img_url"] == Null) {
      imgURl = "";
    } else {
      imgURl = "https://drive.google.com/uc?export=view&id=${json["img_url"]}";
    }

    return TestModel(
      a: json["A"] == null || json["A"] == Null ? "" : json["A"],
      b: json["B"] == null || json["B"] == Null ? "" : json["B"],
      c: json["C"] == null || json["C"] == Null ? "" : json["C"],
      d: json["D"] == null || json["D"] == Null ? "" : json["D"],
      e: json["E"] == null || json["E"] == Null ? "" : json["E"],
      ansDesc: json["ans_desc"] == null || json["ans_desc"] == Null
          ? ""
          : json["ans_desc"],
      corrAns: json["corr_ans"] == null || json["corr_ans"] == Null
          ? ""
          : json["corr_ans"],
      desc: json["desc"] == null || json["desc"] == Null ? "" : json["desc"],
      id: json["id"] == null || json["id"] == Null ? -1 : json["id"],
      imgUrl: imgURl,
    );
  }

  Map<String, dynamic> toJson() => {
        "A": a,
        "B": b,
        "C": c,
        "D": d,
        "E": e,
        "ans_desc": ansDesc,
        "corr_ans": corrAns,
        "desc": desc,
        "id": id,
        "img_url": imgUrl,
      };

  @override
  List<Object?> get props => [a, b, c, d, e, ansDesc, id];
}
