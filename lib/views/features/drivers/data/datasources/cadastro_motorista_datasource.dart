import 'dart:convert';
import 'dart:developer';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_motorista_repository.dart';
import 'package:http/http.dart' as http;

abstract class ICadastroMotoristaDatasource {
  Future<bool> cadastrarMotorista({required CadastroMotoristaParams params});
}

class CadastroMotoristaDataourceImpl extends ICadastroMotoristaDatasource {
  final NetWorkInfoImpl? netWorkInfoImpl;
  final http.Client? client;
  CadastroMotoristaDataourceImpl({required this.client, this.netWorkInfoImpl});
  final url = Uri.parse("$baseDevUrl/api/insertUsuario");

  @override
  Future<bool> cadastrarMotorista(
      {required CadastroMotoristaParams params}) async {
    print(params.telefone);
    print(params.celular);
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token":
                  "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG"
                      .toString(),
              "usuario": {
                "Nome": params.nome.toString(),
                "DataNascimento": params.dataNascimento.toString(),
                "Telefone": params.telefone.toString(),
                "Celular": params.celular.toString(),
                "Email": params.email.toString(),
                "Cep": params.cep.toString(),
                "Numero": params.numero.toString(),
                "Bairro": params.bairro.toString(),
                "Cidade": params.cidade.toString(),
                "Endereco": params.endereco.toString(),
                "Complemento": params.complemento.toString(),
                "Estado": params.estado.toString(),
                "Tipo": params.tipo.toString(),
              },
            },
          ));
      log(result.body.toString());
      return Future.value(true);
    } else {
      throw NetWorkException(message: "sem conexao a internet");
    }
  }
}
