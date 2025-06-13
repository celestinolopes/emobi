// To parse this JSON data, do
//
//     final desembarqueModel = desembarqueModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/parents/domain/entities/desembrarque_entity.dart';

List<DesembarqueModel> desembarqueModelFromJson(String str) =>
    List<DesembarqueModel>.from(
        json.decode(str).map((x) => DesembarqueModel.fromJson(x)));

String desembarqueModelToJson(List<DesembarqueModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DesembarqueModel extends DesembarqueaEntity {
  DesembarqueModel({
    super.id,
    super.nome,
    super.foto,
  });

  factory DesembarqueModel.fromJson(Map<String, dynamic> json) =>
      DesembarqueModel(
        id: json["Id"],
        nome: json["Nome"],
        foto: json["Foto"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nome": nome,
        "Foto": foto,
      };
}
