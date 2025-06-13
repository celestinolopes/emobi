// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

List<ChatModel> chatModelFromJson(String str) =>
    List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String chatModelToJson(List<ChatModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel {
  final bool ok;
  final int id;
  final String mensagem;
  final String usuarioEnvioNome;
  final String usuarioEnvioFoto;
  final int usuarioEnvioId;
  final String usuarioReceptorNome;
  final String usuarioReceptorFoto;
  final int usuarioReceptorId;
  final bool envio;
  final DateTime dataEnvio;

  ChatModel({
    required this.ok,
    required this.id,
    required this.mensagem,
    required this.usuarioEnvioNome,
    required this.usuarioEnvioFoto,
    required this.usuarioEnvioId,
    required this.usuarioReceptorNome,
    required this.usuarioReceptorFoto,
    required this.usuarioReceptorId,
    required this.envio,
    required this.dataEnvio,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
        ok: json["OK"],
        id: json["Id"],
        mensagem: json["Mensagem"],
        usuarioEnvioNome: json["UsuarioEnvio_Nome"],
        usuarioEnvioFoto: json["UsuarioEnvio_Foto"],
        usuarioEnvioId: json["UsuarioEnvio_Id"],
        usuarioReceptorNome: json["UsuarioReceptor_Nome"],
        usuarioReceptorFoto: json["UsuarioReceptor_Foto"],
        usuarioReceptorId: json["UsuarioReceptor_Id"],
        envio: json["Envio"],
        dataEnvio: DateTime.parse(json["DataEnvio"]),
      );

  Map<String, dynamic> toJson() => {
        "OK": ok,
        "Id": id,
        "Mensagem": mensagem,
        "UsuarioEnvio_Nome": usuarioEnvioNome,
        "UsuarioEnvio_Foto": usuarioEnvioFoto,
        "UsuarioEnvio_Id": usuarioEnvioId,
        "UsuarioReceptor_Nome": usuarioReceptorNome,
        "UsuarioReceptor_Foto": usuarioReceptorFoto,
        "UsuarioReceptor_Id": usuarioReceptorId,
        "Envio": envio,
        "DataEnvio": dataEnvio.toIso8601String(),
      };
}
