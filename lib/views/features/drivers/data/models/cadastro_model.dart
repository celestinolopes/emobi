// To parse this JSON data, do
//
//     final cadastroModel = cadastroModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/drivers/domain/entities/cadastro_entity.dart';

CadastroModel cadastroModelFromJson(String str) =>
    CadastroModel.fromJson(json.decode(str));

String cadastroModelToJson(CadastroModel data) => json.encode(data.toJson());

class CadastroModel extends CadastroEntity {
  CadastroModel({
    super.ok,
    super.idUser,
  });

  factory CadastroModel.fromJson(Map<String, dynamic> json) => CadastroModel(
        ok: json["OK"],
        idUser: json["IdUser"],
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "IdUser": idUser,
      };
}
