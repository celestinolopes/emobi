import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/informe_motorista.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelecionarMotoristaChat extends StatefulWidget {
  const SelecionarMotoristaChat({super.key});

  @override
  State<SelecionarMotoristaChat> createState() =>
      _SelecionarMotoristaChatState();
}

class _SelecionarMotoristaChatState extends State<SelecionarMotoristaChat> {
  String? _motoristaSelecionado; // Armazena o motorista selecionado

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
                "Selecionar motorista".toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: ListView(
                children: [
                  _buildMotoristaCard(
                    motoristaNome: "João Silva",
                    setorViagens: "Setor A",
                    totalViagens: 120,
                    alunoNome: "Lucas",
                    motoristaFoto: "assets/images/avatar.jpg",
                    alunoFoto: "assets/images/crianca.jpg",
                  ),
                  const SizedBox(height: 10),
                  _buildMotoristaCard(
                    motoristaNome: "Maria Oliveira",
                    setorViagens: "Setor B",
                    totalViagens: 95,
                    alunoNome: "Ana",
                    motoristaFoto: "assets/images/avatar.jpg",
                    alunoFoto: "assets/images/crianca.jpg",
                  ),
                  const SizedBox(height: 10),
                  _buildMotoristaCard(
                    motoristaNome: "Carlos Santos",
                    setorViagens: "Setor C",
                    totalViagens: 150,
                    alunoNome: "Pedro",
                    motoristaFoto: "assets/images/avatar.jpg",
                    alunoFoto: "assets/images/crianca.jpg",
                  ),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 200,
                child: ButtonCustom(
                  IsEnabled: true,
                  iconRigth: Icons.arrow_forward,
                  backgroundColor: PalleteColors.accentColor,
                  textColor: Colors.white,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  fontWeight: FontWeight.w900,
                  size: const Size(40, 30),
                  height: 40,
                  onPressed: () async {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => const InformeAoMotorista(),
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
    required String motoristaNome,
    required String setorViagens,
    required int totalViagens,
    required String alunoNome,
    required String motoristaFoto,
    required String alunoFoto,
  }) {
    final bool isSelected = _motoristaSelecionado == motoristaNome;

    return GestureDetector(
      onTap: () {
        setState(() {
          _motoristaSelecionado =
              motoristaNome; // Atualiza o motorista selecionado
        });
      },
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
            // Foto do motorista
            CircleAvatar(
              backgroundImage: AssetImage(motoristaFoto),
              radius: 30,
            ),
            const SizedBox(width: 10),
            // Informações do motorista
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    motoristaNome,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Setor: $setorViagens",
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.blue : Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Total de viagens: $totalViagens",
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
                CircleAvatar(
                  backgroundImage: AssetImage(alunoFoto),
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
                      alunoNome,
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
