import 'dart:convert';
import 'dart:developer';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/childrens/data/models/cadastro_model.dart';
import 'package:e_mobi/views/features/childrens/data/models/meus_filhos_model.dart';
import 'package:e_mobi/views/features/childrens/domain/repositories/cadastro_aluno_repository.dart';
import 'package:e_mobi/views/features/childrens/domain/usecases/get_meus_filhos.dart';
import 'package:http/http.dart' as http;

abstract class ICadastroAlunoDatasource {
  Future<CadastroAlunoModel> cadastrarAluno(
      {required CadastroAlunoParams params});

  Future<List<MeusFilhosModel>> getAlunos({required getAlunosParams params});
}

class CadastroAlunoDataourceImpl extends ICadastroAlunoDatasource {
  final NetWorkInfoImpl? netWorkInfoImpl;
  final http.Client? client;
  CadastroAlunoDataourceImpl({required this.client, this.netWorkInfoImpl});
  final url = Uri.parse("$baseDevUrl/api/insertUsuario");
  final meusFilhosUrl = Uri.parse("$baseDevUrl/api/getMeusFilhos");

  @override
  Future<CadastroAlunoModel> cadastrarAluno(
      {required CadastroAlunoParams params}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token":
                  "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG"
                      .toString(),
              "IdPai": "19",
              "usuario": {
                "Nome": params.nome.toString(),
                "DataNascimento": params.dataNascimento.toString(),
                "EnderecoEmbarqueNumero": params.numero.toString(),
                "Endereco": params.endereco.toString(),
                "Escola": params.escola.toString(),
                "Serie": params.serie.toString(),
                "EnderecoEmbarque": params.endereco.toString(),
                "Tipo": "1",
              },
            },
          ));
      log(result.body.toString());
      return Future.value(cadastroAlunoModelFromJson(result.body));
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }

  @override
  Future<List<MeusFilhosModel>> getAlunos(
      {required getAlunosParams params}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(meusFilhosUrl,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token":
                  "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG"
                      .toString(),
              "User": params.userId.toString(),
            },
          ));
      log(result.body.toString());
      return Future.value(meusFilhosModelFromJson(result.body));
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }
}
