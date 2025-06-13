// To parse this JSON data, do
//
//     final cadastroAlunoModel = cadastroAlunoModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/childrens/domain/entities/cadastro_aluno_entity.dart';

CadastroAlunoModel cadastroAlunoModelFromJson(String str) =>
    CadastroAlunoModel.fromJson(json.decode(str));

String cadastroAlunoModelToJson(CadastroAlunoModel data) =>
    json.encode(data.toJson());

class CadastroAlunoModel extends CadastroAlunoEntity {
  CadastroAlunoModel({
    super.ok,
    super.idUser,
  });

  factory CadastroAlunoModel.fromJson(Map<String, dynamic> json) =>
      CadastroAlunoModel(
        ok: json["OK"],
        idUser: json["IdUser"],
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "IdUser": idUser,
      };
}
