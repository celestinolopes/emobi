// To parse this JSON data, do
//
//     final statusMotoristaModel = statusMotoristaModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/parents/domain/entities/status_motorista_entity.dart';

StatusMotoristaModel statusMotoristaModelFromJson(String str) =>
    StatusMotoristaModel.fromJson(json.decode(str));

String statusMotoristaModelToJson(StatusMotoristaModel data) =>
    json.encode(data.toJson());

class StatusMotoristaModel extends StatusMotoristaEntity {
  @override
  final bool? ok;
  @override
  final String? status;

  StatusMotoristaModel({
    this.ok,
    this.status,
  });

  factory StatusMotoristaModel.fromJson(Map<String, dynamic> json) =>
      StatusMotoristaModel(
        ok: json["OK"],
        status: json["Status"],
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "Status": status,
      };
}
