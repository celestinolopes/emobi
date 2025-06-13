import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/home/presentation/screens/home_usuario.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormaPagamentoScrren extends StatefulWidget {
  const FormaPagamentoScrren({super.key});

  @override
  State<FormaPagamentoScrren> createState() => _FormaPagamentoScrrenState();
}

class _FormaPagamentoScrrenState extends State<FormaPagamentoScrren> {
  String? _formaSelecionada; // Armazena a forma de pagamento selecionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Adicionar forma de pagamento".toUpperCase(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            _buildFormaPagamentoCard(
              "Cartão de crédito ou débito",
              "Pague com seu cartão de crédito ou débito.",
              Icons.credit_card,
            ),
            const SizedBox(height: 10),
            _buildFormaPagamentoCard(
              "Pix",
              "Pague rapidamente usando Pix.",
              Icons.qr_code,
            ),
            const SizedBox(height: 10),
            _buildFormaPagamentoCard(
              "Boleto bancário",
              "Gere um boleto para pagamento.",
              Icons.receipt_long,
            ),
            const SizedBox(height: 10),
            _buildFormaPagamentoCard(
              "Adicionar cupom de desconto",
              "Insira um código promocional.",
              Icons.card_giftcard,
            ),
            const SizedBox(height: 100),
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
                        builder: (_) => const HomeUsuario(),
                      ),
                    );
                  },
                  text: "Continuar",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormaPagamentoCard(
      String titulo, String subtitulo, IconData icone) {
    final bool isSelected = _formaSelecionada == titulo;

    return GestureDetector(
      onTap: () {
        setState(() {
          _formaSelecionada = titulo; // Atualiza a forma selecionada
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
            Icon(
              icone,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 10),
            Column(
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
                  subtitulo,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: isSelected ? Colors.blue : Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
