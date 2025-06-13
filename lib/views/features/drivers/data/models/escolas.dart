// To parse this JSON data, do
//
//     final escolasModel = escolasModelFromJson(jsonString);

import 'dart:convert';

EscolasModel escolasModelFromJson(String str) =>
    EscolasModel.fromJson(json.decode(str));

String escolasModelToJson(EscolasModel data) => json.encode(data.toJson());

class EscolasModel {
  final bool ok;
  final List<Aluno> alunos;

  EscolasModel({
    required this.ok,
    required this.alunos,
  });

  factory EscolasModel.fromJson(Map<String, dynamic> json) => EscolasModel(
        ok: json["OK"],
        alunos: List<Aluno>.from(json["Alunos"].map((x) => Aluno.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "Alunos": List<dynamic>.from(alunos.map((x) => x.toJson())),
      };
}

class Aluno {
  final String escola;

  Aluno({
    required this.escola,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) => Aluno(
        escola: json["Escola"],
      );

  Map<String, dynamic> toJson() => {
        "Escola": escola,
      };
}
