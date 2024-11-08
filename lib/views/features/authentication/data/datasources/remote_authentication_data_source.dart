import 'dart:developer';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:http/http.dart' as http;

import '../../domain/usecases/authentication_usecase.dart';
import '../models/user_model.dart';

abstract class IRemoteAuthenticationDataSource {
  Future<UserModel> authenticate(AuthParams authParams);
}

class RemoteAuthenticationDataSourceImpl
    implements IRemoteAuthenticationDataSource {
  final headers = {
    'Authorization': 'Bearer ${GlobalVars.token}',
  };
  final http.Client client;
  final NetWorkInfoImpl? netWorkInfoI;
  RemoteAuthenticationDataSourceImpl(
      {required this.client, required this.netWorkInfoI});

  @override
  Future<UserModel> authenticate(AuthParams authParams) async {
    if (await netWorkInfoI!.isConnected) {
      final response =
          await client.post(Uri.parse("$baseDevUrl/api/login"), body: {
        "User": authParams.username,
        "Pass": authParams.password,
        "Token": GlobalVars.token,
      }).timeout(const Duration(seconds: 60));
      log(response.body);
      if (response.statusCode == 200) {
        return Future.value(
          userModelFromJson(response.body),
        );
      } else if (response.statusCode == 401) {
        throw LoginException(message: "Usuario nao autorizado");
      } else {
        throw ServerException(message: "StatusCode: ${response.statusCode}");
      }
    } else {
      throw NetWorkException(message: "Sem conexão a internet");
    }
  }
}
