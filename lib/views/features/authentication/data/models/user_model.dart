// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:e_mobi/views/features/authentication/domain/entities/user_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  @override
  final bool? ok;
  @override
  final int? id;
  @override
  final String? nome;
  @override
  final String? dataNascimento;
  @override
  final String? celular;
  @override
  final String? telefone;
  @override
  final String? cep;
  @override
  final String? bairro;
  @override
  final String? endereco;
  @override
  final String? numero;
  @override
  final String? complemento;
  @override
  final String? cidade;
  @override
  final String? estado;
  @override
  final String? escola;
  @override
  final String? serie;
  @override
  final String? enderecoEmbarque;
  @override
  final String? enderecoEmbarqueNumero;
  @override
  final String? cpf;
  @override
  final String? rg;
  @override
  final String? senha;
  @override
  final String? email;
  @override
  final String? documentoAluno;
  @override
  final String? paiResponsavel;
  @override
  final String? tipo;
  @override
  final List<Documento>? documentos;

  const UserModel({
    this.ok,
    this.id,
    this.nome,
    this.dataNascimento,
    this.celular,
    this.telefone,
    this.cep,
    this.bairro,
    this.endereco,
    this.numero,
    this.complemento,
    this.cidade,
    this.estado,
    this.escola,
    this.serie,
    this.enderecoEmbarque,
    this.enderecoEmbarqueNumero,
    this.cpf,
    this.rg,
    this.senha,
    this.email,
    this.documentoAluno,
    this.paiResponsavel,
    this.tipo,
    this.documentos,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
        paiResponsavel: json["PaiResponsavel"],
        tipo: json["Tipo"],
        documentos: json["Documentos"] == null
            ? []
            : List<Documento>.from(
                json["Documentos"]!.map((x) => Documento.fromJson(x))),
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
        "PaiResponsavel": paiResponsavel,
        "Tipo": tipo,
        "Documentos": documentos == null
            ? []
            : List<dynamic>.from(documentos!.map((x) => x.toJson())),
      };
}

class Documento extends DocumentoEntity {
  @override
  final int? id;
  @override
  final String? tipo;
  @override
  final String? documento;

  Documento({
    this.id,
    this.tipo,
    this.documento,
  });

  factory Documento.fromJson(Map<String, dynamic> json) => Documento(
        id: json["Id"],
        tipo: json["Tipo"],
        documento: json["Documento"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Tipo": tipo,
        "Documento": documento,
      };
}
