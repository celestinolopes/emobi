import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../widgets/button_custom_widget.dart';
import '../../../parents/presentation/screens/solicitatar_motorista.dart'
    show MotoristaBuscaModel;
import 'motoristas_encontrados.dart';

class MotoristaEncontrado extends StatelessWidget {
  final List<MotoristaBuscaModel> motoristas;
  const MotoristaEncontrado({super.key, required this.motoristas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PalleteColors.primaryColor,
      appBar: AppBar(
        backgroundColor: PalleteColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          Center(
            child: CustomText(
              text: "ÓTIMO",
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          CustomText(
            text: "Encontramos o seu veículo",
            fontSize: 12.sp,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 10),
          const Icon(
            Icons.check_circle_outline,
            color: Colors.green,
            size: 80,
          ),
          const SizedBox(height: 200),
          SizedBox(
            width: 300,
            child: ButtonCustom(
              iconRigth: Icons.arrow_forward,
              backgroundColor: PalleteColors.accentColor,
              size: const Size(40, 30),
              height: 40,
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => MotoristasEncontrados(
                      motoristas: motoristas,
                    ),
                  ),
                );
              },
              textColor: Colors.white,
              text: "Continuar",
            ),
          ),
        ],
      ),
    );
  }
}
