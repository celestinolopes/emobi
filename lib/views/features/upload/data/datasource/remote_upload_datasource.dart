import 'dart:developer';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/upload/domain/repositories/i_ipload_repository.dart';
import 'package:http/http.dart' as http;

abstract class IRemoteUploadDataSource {
  Future<bool> uploadDocument({UploadDocParams? params});
}

class RemoteUploadDataSourceImpl extends IRemoteUploadDataSource {
  final NetWorkInfoImpl netWorkInfoImpl;
  final http.Client client;

  RemoteUploadDataSourceImpl(
      {required this.client, required this.netWorkInfoImpl});

  @override
  Future<bool> uploadDocument({UploadDocParams? params}) async {
    if (await netWorkInfoImpl.isConnected) {
      final response = await client
          .post(Uri.parse("$baseDevUrl/api/envioDocumentosUsuario"), body: {
        "Documento": params!.documento.toString(),
        "tipoDocumento": params.tipoDocumento.toString(),
        "idUser": params.idUser.toString(),
        "Token": GlobalVars.token.toString(),
      }).timeout(const Duration(seconds: 60));
      log(response.body);
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ServerException(message: "StatusCode: ${response.statusCode}");
      }
    } else {
      throw NetWorkException(message: "Sem conexão a internet");
    }
  }
}
