import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AceitarMotorista extends StatelessWidget {
  const AceitarMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF28d123),
      ),
      backgroundColor: const Color(0xFF28d123),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: "CORRIDA ACEITA",
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.asset(
              "assets/images/check_green.png",
              width: 100,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Em breve você receberá as infromações\n para os próximos passos\n Fique atento(a) às notificações do aplicativo",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
