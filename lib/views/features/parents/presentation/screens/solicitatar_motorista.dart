import 'dart:convert';
import 'dart:developer';

import 'package:e_mobi/views/features/drivers/presentation/screeens/motorista_encontrado.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class MotoristaBuscaModel {
  final bool ok;
  final String nome;
  final String foto;
  final String dataNascimento;
  final String dataCadastro;
  final String veiculoNome;
  final String veiculoAno;
  final String veiculoFoto;

  MotoristaBuscaModel({
    required this.ok,
    required this.nome,
    required this.foto,
    required this.dataNascimento,
    required this.dataCadastro,
    required this.veiculoNome,
    required this.veiculoAno,
    required this.veiculoFoto,
  });

  factory MotoristaBuscaModel.fromJson(Map<String, dynamic> json) {
    return MotoristaBuscaModel(
      ok: json['OK'] ?? false,
      nome: json['Nome'] ?? '',
      foto: json['Foto'] ?? '',
      dataNascimento: json['DataNascimento'] ?? '',
      dataCadastro: json['DataCadastro'] ?? '',
      veiculoNome: json['VeiculoNome'] ?? '',
      veiculoAno: json['VeiculoAno'] ?? '',
      veiculoFoto: json['VeiculoFoto'] ?? '',
    );
  }
}

class SolicitarMotorista extends StatefulWidget {
  const SolicitarMotorista({super.key});

  @override
  State<SolicitarMotorista> createState() => _SolicitarMotoristaState();
}

class _SolicitarMotoristaState extends State<SolicitarMotorista> {
  @override
  void initState() {
    super.initState();
    buscarMotoristas().then((motoristas) {
      log(motoristas.toString());
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => MotoristaEncontrado(motoristas: motoristas),
        ),
      );
    });
  }

  Future<List<MotoristaBuscaModel>> buscarMotoristas() async {
    final response = await http.post(
      Uri.parse(
          'https://emobi.keltecnologia.com.br/api/getBuscaMotoristasByResponsavel'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "Token":
            "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG",
        "User": "53",
        "LocalizacaoLatitude": "",
        "LocalizacaoLongitude": "",
        "Nome": "",
        "Email": "",
        "Telefone": "",
        "Observacao": ""
      }),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => MotoristaBuscaModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao buscar motoristas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          Center(
            child: CustomText(
              text: "AGUARDE!",
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          CustomText(
            text: "Estamos encontrando um veículo",
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          Image.asset(
            "assets/images/lupa.png",
            width: 70,
          )
        ],
      ),
    );
  }
}
