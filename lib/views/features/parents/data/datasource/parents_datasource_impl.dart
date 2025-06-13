import 'dart:convert';
import 'dart:developer';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/parents/data/model/desembarque_model.dart';
import 'package:e_mobi/views/features/parents/data/model/meus_alunos_model.dart';
import 'package:e_mobi/views/features/parents/data/model/status_motorista_model.dart';
import 'package:e_mobi/views/features/parents/domain/entities/status_motorista_entity.dart';
import 'package:http/http.dart' as http;

import '../../domain/repositories/parent_repository.dart';

abstract class IParentsDatasource {
  Future<bool> getMeusTrajetos({required int idResponsavel});
  Future<bool> getMotoristas({required getMotoristaParams params});
  Future<MeusAlunosModel> getMeusAlunosMotoristas({required int motoristaId});
  Future<List<DesembarqueModel>> getMeusDesembarqueMotoristas(
      {required int motoristaId});

  Future<bool> confirmarEmbarque({
    required int idAluno,
    required int idMotorista,
  });
  Future<bool> confirmarDesembarque({
    required int idAluno,
    required int idMotorista,
  });

  Future<StatusMotoristaEntity> getStatusAsMotoristas(
      {required String motoristaId});
}

class ParentsDatasourceImpl implements IParentsDatasource {
  final NetWorkInfoImpl? netWorkInfoImpl;
  final http.Client? client;
  final String? apiToken =
      "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG";
  ParentsDatasourceImpl({required this.client, this.netWorkInfoImpl});

  @override
  Future<bool> getMeusTrajetos({required int idResponsavel}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!
          .post(Uri.parse("$baseDevUrl/api/getMeuTrajetoPrincipal"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(
                {"Token": apiToken, "User": idResponsavel},
              ));

      return Future.value(false);
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<bool> getMotoristas({required getMotoristaParams params}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(
          Uri.parse("$baseDevUrl/api/getMeuTrajetoPrincipal"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token": apiToken, "User": params.idMotorista, //id do responsavel
              "LocalizacaoLatitude": params.latitude,
              "LocalizacaoLongitude": params.longitude,
              "Observacao": params.observacao
            },
          ));

      return Future.value(false);
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<MeusAlunosModel> getMeusAlunosMotoristas(
      {required int motoristaId}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!
          .post(Uri.parse("$baseDevUrl/api/getMeusAlunosByMotorista"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(
                {
                  "Token": apiToken, "User": motoristaId, //id do responsavel
                },
              ));
      log(result.body);
      return Future.value(meusAlunosModelFromJson(result.body));
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<StatusMotoristaEntity> getStatusAsMotoristas(
      {required String motoristaId}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!
          .post(Uri.parse("$baseDevUrl/api/getStatusVinculoMotorista"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(
                {
                  "Token": apiToken, "User": motoristaId, //id do responsavel
                },
              ));

      return Future.value(statusMotoristaModelFromJson(result.body));
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<bool> confirmarEmbarque(
      {required int idAluno, required int idMotorista}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(
          Uri.parse("$baseDevUrl/api/setConfirmaEmbarqueByMotoristaAluno"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token": apiToken,
              "User": idAluno,
              "UserMotorista": idMotorista,
            },
          ));

      return Future.value(true);
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<bool> confirmarDesembarque(
      {required int idAluno, required int idMotorista}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(
          Uri.parse("$baseDevUrl/api/setConfirmaDesembarqueByMotoristaAluno"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token": apiToken,
              "User": idAluno,
              "UserMotorista": idMotorista,
            },
          ));

      return Future.value(true);
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<List<DesembarqueModel>> getMeusDesembarqueMotoristas(
      {required int motoristaId}) async {
    // TODO: implement getMeusDesembarqueMotoristas
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!
          .post(Uri.parse("$baseDevUrl/api/getMeuDesembarqueByMotorista"),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode(
                {
                  "Token": apiToken,
                  "User": motoristaId,
                },
              ));
      log(result.body);
      return Future.value(desembarqueModelFromJson(result.body));
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }
}
