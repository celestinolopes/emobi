// To parse this JSON data, do
//
//     final meusAlunosModel = meusAlunosModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/parents/domain/entities/meus_alunos_entity.dart';

MeusAlunosModel meusAlunosModelFromJson(String str) =>
    MeusAlunosModel.fromJson(json.decode(str));

String meusAlunosModelToJson(MeusAlunosModel data) =>
    json.encode(data.toJson());

class MeusAlunosModel extends MeusAlunosEntity {
  @override
  final bool? ok;

  @override
  final List<Aluno>? alunos;

  MeusAlunosModel({
    this.ok,
    this.alunos,
  });

  factory MeusAlunosModel.fromJson(Map<String, dynamic> json) =>
      MeusAlunosModel(
        ok: json["OK"],
        alunos: json["Alunos"] == null
            ? []
            : List<Aluno>.from(json["Alunos"]!.map((x) => Aluno.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "Alunos": alunos == null
            ? []
            : List<dynamic>.from(alunos!.map((x) => x.toJson())),
      };
}

class Aluno extends AlunoEntity {
  Aluno({
    super.id,
    super.nome,
    super.dataNascimento,
    super.escola,
    super.serie,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) => Aluno(
        id: json["Id"],
        nome: json["Nome"],
        dataNascimento: json["DataNascimento"],
        escola: json["Escola"],
        serie: json["Serie"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nome": nome,
        "DataNascimento": dataNascimento,
        "Escola": escola,
        "Serie": serie,
      };
}
