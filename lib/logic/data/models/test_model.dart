// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
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

  String? a;
  String? b;
  String? c;
  String? d;
  String? e;
  String? ansDesc;
  String? corrAns;
  String? desc;
  int? id;
  String? imgUrl;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        a: json["A"],
        b: json["B"],
        c: json["C"],
        d: json["D"],
        e: json["E"],
        ansDesc: json["ans_desc"],
        corrAns: json["corr_ans"],
        desc: json["desc"],
        id: json["id"],
        imgUrl: json["img_url"],
      );

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
}
