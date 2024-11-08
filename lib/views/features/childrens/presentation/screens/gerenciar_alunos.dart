import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/informe_motorista.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/minhas_viagens.dart';
import 'package:e_mobi/views/features/childrens/presentation/screens/notificacoes_alunos.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_archive_button.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GerenciarAlunos extends StatelessWidget {
  const GerenciarAlunos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Center(
              child: Text(
                "Gerenciar aluno".toUpperCase(),
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900,
                  color: PalleteColors.accentColor,
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
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: PalleteColors.primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        CustomText(
                          text: "• ALICE MARTAL",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Color.fromARGB(255, 236, 229, 229),
                        ),
                        CustomText(
                          text: "• IDADE",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: "• ENDEREÇO",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: "• ESCOLA CADASTRADA",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: "• ANO LETIVO",
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/crianca.jpg"),
                      radius: 50,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomArchiveButton(
              text: "Viagens",
              assetIcon: "viagens.png",
              textColor: Colors.white,
              color: PalleteColors.primaryColor,
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const MinhasViagens(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomArchiveButton(
              text: "Notificações",
              assetIcon: "notificacoes.png",
              textColor: Colors.white,
              color: PalleteColors.primaryColor,
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const NotificacoesAlunos(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomArchiveButton(
              text: "Informe ao motorista",
              assetIcon: "informe.png",
              textColor: Colors.white,
              color: PalleteColors.primaryColor,
              onClick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const InformeAoMotorista(),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            CustomArchiveButton(
              text: "Biometria facial",
              assetIcon: "biometria.png",
              textColor: Colors.white,
              color: PalleteColors.primaryColor,
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}
