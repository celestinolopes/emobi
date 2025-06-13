// To parse super JSON data, do
//
//     final meusFilhosModel = meusFilhosModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/childrens/domain/entities/meus_filhos_entity.dart';

List<MeusFilhosModel> meusFilhosModelFromJson(String str) =>
    List<MeusFilhosModel>.from(
        json.decode(str).map((x) => MeusFilhosModel.fromJson(x)));

String meusFilhosModelToJson(List<MeusFilhosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeusFilhosModel extends MeusFilhosEntity {
  MeusFilhosModel({
    super.ok,
    super.id,
    super.nome,
    super.dataNascimento,
    super.celular,
    super.telefone,
    super.cep,
    super.bairro,
    super.endereco,
    super.numero,
    super.complemento,
    super.cidade,
    super.estado,
    super.escola,
    super.serie,
    super.enderecoEmbarque,
    super.enderecoEmbarqueNumero,
    super.cpf,
    super.rg,
    super.senha,
    super.email,
    super.documentoAluno,
    super.foto,
    super.viagens,
  });

  factory MeusFilhosModel.fromJson(Map<String, dynamic> json) =>
      MeusFilhosModel(
        ok: json["OK"],
        id: json["Id"],
        nome: json["Nome"],
        dataNascimento: json["DataNascimento"],
        celular: json["Celular"],
        telefone: json["Telefone"],
        cep: json["Cep"],
        bairro: json["Bairro"],
        endereco: json["Endereco"],
        numero: json["Numero"],
        complemento: json["Complemento"],
        cidade: json["Cidade"],
        estado: json["Estado"],
        escola: json["Escola"],
        serie: json["Serie"],
        enderecoEmbarque: json["EnderecoEmbarque"],
        enderecoEmbarqueNumero: json["EnderecoEmbarqueNumero"],
        cpf: json["Cpf"],
        rg: json["Rg"],
        senha: json["Senha"],
        email: json["Email"],
        documentoAluno: json["DocumentoAluno"],
        foto: json["Foto"],
        viagens: json["Viagens"] == null
            ? []
            : List<dynamic>.from(json["Viagens"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "Id": id,
        "Nome": nome,
        "DataNascimento": dataNascimento,
        "Celular": celular,
        "Telefone": telefone,
        "Cep": cep,
        "Bairro": bairro,
        "Endereco": endereco,
        "Numero": numero,
        "Complemento": complemento,
        "Cidade": cidade,
        "Estado": estado,
        "Escola": escola,
        "Serie": serie,
        "EnderecoEmbarque": enderecoEmbarque,
        "EnderecoEmbarqueNumero": enderecoEmbarqueNumero,
        "Cpf": cpf,
        "Rg": rg,
        "Senha": senha,
        "Email": email,
        "DocumentoAluno": documentoAluno,
        "Foto": foto,
        "Viagens":
            viagens == null ? [] : List<dynamic>.from(viagens!.map((x) => x)),
      };
}
