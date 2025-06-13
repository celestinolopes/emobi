import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/home/presentation/screens/home_usuario.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/material.dart';

class SolicitacaoMotivoAnalise extends StatelessWidget {
  SolicitacaoMotivoAnalise({super.key});
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
              Center(
                child: Text(
                  "Solicitação em Análise".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Image.asset("assets/images/update.png"),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "Você será informado(a) sobre\n atualizações dessa solicitação\n no botão notificações no menu\n princial do app.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
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
                      page: const HomeUsuario(),
                    );
                  },
                  text: "Ok",
                ),
              )),
            ],
          ),
        ));
  }
}
