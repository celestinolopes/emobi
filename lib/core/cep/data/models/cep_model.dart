// To parse super JSON data, do
//
//     final cepModelo = cepModeloFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/core/cep/domain/entities/cep_entity.dart';

CepModelo cepModeloFromJson(String str) => CepModelo.fromJson(json.decode(str));

String cepModeloToJson(CepModelo data) => json.encode(data.toJson());

class CepModelo extends CepEntity {
  CepModelo({
    super.cep,
    super.logradouro,
    super.complemento,
    super.unidade,
    super.bairro,
    super.localidade,
    super.uf,
    super.estado,
    super.regiao,
    super.ibge,
    super.gia,
    super.ddd,
    super.siafi,
  });

  factory CepModelo.fromJson(Map<String, dynamic> json) => CepModelo(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        unidade: json["unidade"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        estado: json["estado"],
        regiao: json["regiao"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"],
        siafi: json["siafi"],
      );

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "unidade": unidade,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "estado": estado,
        "regiao": regiao,
        "ibge": ibge,
        "gia": gia,
        "ddd": ddd,
        "siafi": siafi,
      };
}
