import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContatoMotorista extends StatelessWidget {
  const ContatoMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Center(
                child: CustomText(
                  text: "Estamos entrando em contato com o seu motorista",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 40),
              Image.asset("assets/images/loading.png"),
              const SizedBox(height: 80),
              Center(
                child: Image.asset(
                  "assets/images/notification_2.png",
                  width: 40,
                ),
              ),
              CustomText(
                text:
                    "Você será informado(a) sobre atualizações dessa solicitação no botão 'notificações' no menu principal do APP",
                fontSize: 11.sp,
                textAlign: TextAlign.center,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
        ),
      ),
    );
  }
}
