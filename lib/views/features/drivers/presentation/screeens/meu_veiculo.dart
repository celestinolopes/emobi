import 'dart:convert';

import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:http/http.dart' as http;

class VeiculoModel {
  final int id;
  final String categoria;
  final String modelo;
  final String placa;
  final String anoFabricacao;
  final int lotacao;
  final List<String> arquivos;
  final List<String> fotos;

  VeiculoModel({
    required this.id,
    required this.categoria,
    required this.modelo,
    required this.placa,
    required this.anoFabricacao,
    required this.lotacao,
    required this.arquivos,
    required this.fotos,
  });

  factory VeiculoModel.fromJson(Map<String, dynamic> json) {
    return VeiculoModel(
      id: json['Id'],
      categoria: json['Categoria'] ?? '',
      modelo: json['Modelo'] ?? '',
      placa: json['VeiculoPlaca'] ?? '',
      anoFabricacao: json['AnoFabricacao'] ?? '',
      lotacao: json['Lotacao'] ?? 0,
      arquivos: (json['Arquivos'] as List<dynamic>?)
              ?.map((a) => a['Documento'] as String)
              .toList() ??
          [],
      fotos: (json['Fotos'] as List<dynamic>?)
              ?.map((f) => f['Foto'] as String)
              .toList() ??
          [],
    );
  }
}

class MeuVeiculo extends StatefulWidget {
  const MeuVeiculo({super.key});

  @override
  State<MeuVeiculo> createState() => _MeuVeiculoState();
}

class _MeuVeiculoState extends State<MeuVeiculo> {
  late Future<VeiculoModel> _futureVeiculo;

  @override
  void initState() {
    super.initState();
    _futureVeiculo = buscarVeiculo();
  }

  Future<VeiculoModel> buscarVeiculo() async {
    final response = await http.post(
      Uri.parse(
          'https://emobi.keltecnologia.com.br/api/getMeuVeiculoByMotorista'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "Token":
            "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG",
        "User": "53", // id do motorista
      }),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return VeiculoModel.fromJson(data);
    } else {
      throw Exception('Falha ao carregar veículo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder<VeiculoModel>(
          future: _futureVeiculo,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Erro: ${snapshot.error}'));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text('Nenhum dado encontrado.'));
            }
            final veiculo = snapshot.data!;
            return ListView(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    "Veículo".toUpperCase(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: PalleteColors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 80),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 210,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 60),
                            Center(
                              child: CustomText(
                                text: veiculo.modelo,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: "Categoria:",
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                CustomText(
                                  text: veiculo.categoria,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            CustomText(
                              text:
                                  "Ano de fabricação: ${veiculo.anoFabricacao.split('T').first}",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 2),
                            CustomText(
                              text: "Lugares: ${veiculo.lotacao}",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 2),
                            CustomText(
                              text: "Placa: ${veiculo.placa}",
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            const SizedBox(height: 2),
                          ],
                        ),
                      ),
                    ),
                    if (veiculo.fotos.isNotEmpty)
                      Positioned(
                        top: -60,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(veiculo.fotos.first),
                            radius: 50,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 30),
                if (veiculo.fotos.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GalleryImage(
                          imageUrls: veiculo.fotos,
                          numOfShowImages: veiculo.fotos.length,
                          titleGallery: "Imagens do veículo",
                        )
                      ],
                    ),
                  ),
                const SizedBox(height: 10),
                if (veiculo.arquivos.isNotEmpty)
                  Container(
                    height: 60,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CustomText(
                          text: "DOCUMENTO:",
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 10),
                        const CustomText(
                          text: "OK",
                          fontSize: 13,
                          fontWeight: FontWeight.w900,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        // Exemplo de visualização do documento
                        if (veiculo.arquivos.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              // Abrir documento, se desejar
                            },
                            child: const Icon(Icons.picture_as_pdf,
                                color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  child: CustomArchiveButton(
                    text: "Salvar",
                    centered: true,
                    space: 10,
                    assetIcon: "",
                    showIcon: false,
                    color: PalleteColors.accentColor,
                    textAlign: TextAlign.center,
                    onClick: () {},
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
