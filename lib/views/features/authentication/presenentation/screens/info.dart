import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/choice_view.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/cadastro_motorista.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/cadastro_responsavel.dart';
import 'package:e_mobi/widgets/button_custom_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key, required this.choice});
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColors.accentColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: PalleteColors.accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "FIQUE TRANQUILO",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Suas informações e dados pessoais fornecidos serão armazenados em nosso sistema de forma confidencial e segura",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PalleteColors.primaryColor,
                fontSize: 12.sp,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            "assets/images/lock.png",
            width: 130,
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ButtonCustom(
              backgroundColor: PalleteColors.white,
              textColor: PalleteColors.accentColor,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              fontWeight: FontWeight.w700,
              borderRadius: 10,
              size: const Size(40, 30),
              height: 40,
              iconRigth: Icons.arrow_forward,
              onPressed: () {
                if (choice == Choice.responsavel) {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => CadastroResponsavel(),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => CadastroMotorista(),
                    ),
                  );
                }
              },
              text: "Continuar",
            ),
          ),
        ],
      ),
    );
  }
}
