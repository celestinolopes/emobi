import 'dart:developer';

import 'package:e_mobi/views/features/http/models/cep_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CepWebClient extends ChangeNotifier {
  Future<CepUserModel> getCep({
    String? cep,
  }) async {
    log(cep!);
    cep = cep.replaceAll('.', '').replaceAll('-', '');
    try {
      final response = await http.get(
        Uri.parse("https://viacep.com.br/ws/$cep/json/"),
      );

      if (response.statusCode != 200) {
        throw Exception(
          'Erro ao consultar response. StatusCode: ${response.body}',
        );
      }

      return cepUserModelFromJson(response.body);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
