import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DesembarqueSucesso extends StatelessWidget {
  const DesembarqueSucesso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalleteColors.accentColor,
      ),
      backgroundColor: PalleteColors.accentColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: "DESEMBARQUE\nCONCLUÍDO COM SUCCESSO",
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
          )
        ],
      ),
    );
  }
}
