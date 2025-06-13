import 'package:e_mobi/views/features/drivers/presentation/screeens/motorista_encontrado.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SolicitarMotorista extends StatefulWidget {
  const SolicitarMotorista({super.key});

  @override
  State<SolicitarMotorista> createState() => _SolicitarMotoristaState();
}

class _SolicitarMotoristaState extends State<SolicitarMotorista> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => const MotoristaEncontrado(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 150),
          Center(
            child: CustomText(
              text: "AGUARDE!",
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 3),
          CustomText(
            text: "Estamos encontrando um veículo",
            fontSize: 12.sp,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          Image.asset(
            "assets/images/lupa.png",
            width: 70,
          )
        ],
      ),
    );
  }
}
