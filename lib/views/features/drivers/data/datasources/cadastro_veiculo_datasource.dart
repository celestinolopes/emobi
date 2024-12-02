import 'dart:convert';
import 'dart:developer';

import 'package:e_mobi/core/const/const.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:e_mobi/views/features/drivers/domain/repositories/cadastro_veiculo_repository.dart';
import 'package:http/http.dart' as http;

abstract class ICadastroVeiculoDatasource {
  Future<bool> cadastrarVeiculo({required CadastroVeiculoParams params});
}

class CadastroVeiculoDatasourceImpl extends ICadastroVeiculoDatasource {
  final NetWorkInfoImpl? netWorkInfoImpl;
  final http.Client? client;
  CadastroVeiculoDatasourceImpl({required this.client, this.netWorkInfoImpl});
  final url = Uri.parse("$baseDevUrl/api/insertVeiculo");

  @override
  Future<bool> cadastrarVeiculo({required CadastroVeiculoParams params}) async {
    if (await netWorkInfoImpl!.isConnected) {
      final result = await client!.post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(
            {
              "Token":
                  "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG"
                      .toString(),
              "Veiculo": {
                "IdUsuario": params.idUsuario.toString(),
                "AnoFabricacao": params.anoFabrico.toString(),
                "Categoria": params.categoria.toString(),
                "Lotacao": params.lotacao.toString(),
                "DataLocacao": params.dataLocacao.toString(),
                "DataVencimentoLicenca":
                    params.dataVencimentoLicenca.toString(),
                "Modelo": params.modelo.toString(),
                "VeiculoPlaca": params.veiculoPlaca.toString(),
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
