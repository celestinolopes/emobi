import 'dart:convert';

import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/info_motorista_responsave.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrocarMotoristaScreen extends StatefulWidget {
  const TrocarMotoristaScreen({super.key});

  @override
  State<TrocarMotoristaScreen> createState() => _TrocarMotoristaScreenState();
}

class _TrocarMotoristaScreenState extends State<TrocarMotoristaScreen> {
  int? _motoristaSelecionado; // Agora armazena o índice selecionado
  late Future<List<MotoristaModel>> _futureMotoristas;

  @override
  void initState() {
    super.initState();
    _futureMotoristas = buscarMotoristas();
  }

  Future<List<MotoristaModel>> buscarMotoristas() async {
    final response = await http.post(
      Uri.parse(
          'https://emobi.keltecnologia.com.br/api/getBuscaMotoristasByResponsavel'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "Token":
            "-OLMASpkeRP8P-UmnPx5tXVbQi9Ea9qg_7VRnDt9-ifTrjYOPTEylEufu30vxlMfCKbAng4pfKco7OPT12rmGYUIqmslQWt1r1J5FohX5Wv0bFgUkNpIOh5YDDJDcpAG",
        "User": "19",
      }),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => MotoristaModel.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar motoristas');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Trocar de Motorista".toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: FutureBuilder<List<MotoristaModel>>(
                future: _futureMotoristas,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  }
                  final motoristas = snapshot.data ?? [];
                  if (motoristas.isEmpty) {
                    return const Center(
                        child: Text('Nenhum motorista encontrado.'));
                  }
                  return ListView.separated(
                    itemCount: motoristas.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final motorista = motoristas[index];
                      return _buildMotoristaCard(
                        motorista: motorista,
                        isSelected: _motoristaSelecionado == index,
                        onTap: () {
                          setState(() {
                            _motoristaSelecionado = index;
                          });
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: ButtonCustom(
                  IsEnabled: _motoristaSelecionado != null,
                  iconRigth: Icons.arrow_forward,
                  backgroundColor: PalleteColors.accentColor,
                  textColor: Colors.white,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  fontWeight: FontWeight.w900,
                  size: const Size(40, 30),
                  height: 40,
                  onPressed: _motoristaSelecionado == null
                      ? null
                      : () async {
                          final motoristas = await _futureMotoristas;
                          final motoristaSelecionado =
                              motoristas[_motoristaSelecionado!];
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => InformacaoDoMotorista(
                                  motorista: motoristaSelecionado),
                            ),
                          );
                        },
                  text: "Continuar",
                ),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildMotoristaCard({
    required MotoristaModel motorista,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade100 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            // Foto do motorista (de rede ou placeholder)
            CircleAvatar(
              backgroundImage: motorista.foto.isNotEmpty
                  ? NetworkImage(motorista.foto)
                  : const AssetImage('assets/images/avatar.jpg')
                      as ImageProvider,
              radius: 30,
            ),
            const SizedBox(width: 10),
            // Informações do motorista
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    motorista.nome,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Setor: ${motorista.veiculoAno}",
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Data de cadastro: ${motorista.dataCadastro}",
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 90,
              width: 1,
              color: Colors.grey.withOpacity(0.4),
            ),
            const SizedBox(width: 4),
            // Foto do aluno e texto
            Row(
              children: [
                const SizedBox(width: 4),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crianca.jpg'),
                  radius: 20,
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Motorista de:",
                      style: TextStyle(
                        fontSize: 12,
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    Text(
                      "Aluno",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MotoristaModel {
  final bool ok;
  final String nome;
  final String foto;
  final String dataNascimento;
  final String dataCadastro;
  final String veiculoNome;
  final String veiculoAno;
  final String veiculoFoto;

  MotoristaModel({
    required this.ok,
    required this.nome,
    required this.foto,
    required this.dataNascimento,
    required this.dataCadastro,
    required this.veiculoNome,
    required this.veiculoAno,
    required this.veiculoFoto,
  });

  factory MotoristaModel.fromJson(Map<String, dynamic> json) {
    return MotoristaModel(
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
