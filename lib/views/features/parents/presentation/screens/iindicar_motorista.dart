import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/features/parents/presentation/screens/contato_motortista.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:e_mobi/widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class IndicarMotorista extends StatelessWidget {
  const IndicarMotorista({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomText(
                text: "Indique um motorista",
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Image.asset("assets/images/logo_3.png", width: 150),
            ),
            const SizedBox(height: 30),
            const CustomText(
              text: "Nome",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 83, 82, 82),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              keyboadType: TextInputType.name,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Telefone",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 83, 82, 82),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              keyboadType: TextInputType.phone,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Email",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 83, 82, 82),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              keyboadType: TextInputType.emailAddress,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              keyboadType: TextInputType.phone,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            const SizedBox(height: 10),
            const CustomText(
              text: "Observação",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 83, 82, 82),
            ),
            const SizedBox(height: 10),
            TextFieldWidget(
              keyboadType: TextInputType.text,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(17),
              ),
            ),
            const SizedBox(height: 80),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (_) => const ContatoMotorista(),
                  ),
                );
              },
              child: Center(
                child: Container(
                  height: 45,
                  width: 200,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: PalleteColors.accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "Enviar",
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
