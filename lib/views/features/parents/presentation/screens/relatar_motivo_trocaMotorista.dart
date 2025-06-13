import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/solicitacao_motivo_analise.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';

class RelatarMotivoTrocaMotorista extends StatelessWidget {
  RelatarMotivoTrocaMotorista({super.key});
  final TextEditingController _motivoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PalleteColors.primaryColor,
        appBar: AppBar(
          backgroundColor: PalleteColors.primaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Relatar motivo",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _motivoController,
                maxLines: 5, // Permite múltiplas linhas

                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Digite o motivo da troca...",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.white.withOpacity(0.8)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 200,
                  child: ButtonCustom(
                    IsEnabled: true,
                    backgroundColor: PalleteColors.accentColor,
                    textColor: Colors.white,
                    mainAxisAlignment: MainAxisAlignment.center,
                    fontWeight: FontWeight.w900,
                    size: const Size(40, 30),
                    height: 40,
                    onPressed: () {
                      NavigationService.push(
                        context: context,
                        page: SolicitacaoMotivoAnalise(),
                      );
                    },
                    text: "Enviar",
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
