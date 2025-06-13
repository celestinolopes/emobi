import 'package:flutter/material.dart';

class NotificacoesHome extends StatefulWidget {
  const NotificacoesHome({super.key});

  @override
  State<NotificacoesHome> createState() => _NotificacoesHomeState();
}

class _NotificacoesHomeState extends State<NotificacoesHome> {
  String? _motoristaSelecionado; // Armazena o motorista selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Novas notificações".toUpperCase(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildMotoristaCard(
                motoristaNome: "Motorista 1",
                titulo: "Estacionamento",
                alunoNome: "Aluno 1",
                alunoFoto: "assets/images/crianca.jpg",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMotoristaCard({
    required String motoristaNome,
    required String titulo,
    required String alunoNome,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.blue : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    motoristaNome,
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
                const SizedBox(width: 10),
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
