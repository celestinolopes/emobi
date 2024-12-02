// ignore_for_file: must_be_immutable

import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/widgets/text_field/custom_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../widgets/button_custom_widget.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({
    super.key,
  });
  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  final TextEditingController controller = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  bool isPageLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isPageLoading,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Email",
                    textEditingController: _emailController,
                  ),
                  const SizedBox(height: 0),
                  const SizedBox(height: 40),
                  const SizedBox(height: 10),
                  ButtonCustom(
                    backgroundColor: PalleteColors.accentColor,
                    textColor: Colors.white,
                    size: const Size(40, 30),
                    height: 40,
                    onPressed: () {},
                    text: "Recuperar senha",
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
