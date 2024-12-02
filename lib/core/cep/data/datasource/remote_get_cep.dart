import 'package:e_mobi/core/cep/data/models/cep_model.dart';
import 'package:e_mobi/core/errors/exception.dart';
import 'package:e_mobi/core/network/network_info.dart';
import 'package:http/http.dart' as http;

abstract class IRemoteCepDataSource {
  Future<CepModelo> getCep({required String cep});
}

class RemoteCepDataSourceImpl implements IRemoteCepDataSource {
  final http.Client client;
  final NetWorkInfoImpl netWorkInfo;

  RemoteCepDataSourceImpl({required this.netWorkInfo, required this.client});

  @override
  Future<CepModelo> getCep({required String cep}) async {
    if (await netWorkInfo.isConnected) {
      cep = cep.replaceAll('.', '').replaceAll('-', '');

      final response = await http.get(
        Uri.parse("https://viacep.com.br/ws/$cep/json/"),
      );

      if (response.body.length < 30) {
        throw InvalidCepException();
      }
      final cepModelo = cepModeloFromJson(response.body);
      return cepModelo;
    } else {
      throw NetWorkException(message: "Connection to internet is not possible");
    }
  }
}
