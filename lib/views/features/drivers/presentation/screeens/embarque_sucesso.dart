import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class EmbarqueSucesso extends StatelessWidget {
  const EmbarqueSucesso({super.key});

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
            text: "EMBARQUE\nCONCLUÍDO COM SUCCESSO",
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
