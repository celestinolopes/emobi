import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/upload_documentos_motoristas.dart';
import 'package:e_mobi/views/features/http/cep_webclient.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../pallete_colors.dart';
import '../../../../../widgets/button_custom_widget.dart';
import '../../../../../widgets/textfield_widget.dart';

class CadastroMotorista extends StatefulWidget {
  const CadastroMotorista({super.key});

  @override
  State<CadastroMotorista> createState() => _CadastroMotoristaState();
}

class _CadastroMotoristaState extends State<CadastroMotorista> {
  var dateInputFormater = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var celularMaskedInputIntel = MaskTextInputFormatter(
    mask: '+##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var celularMaskInputNumber = MaskTextInputFormatter(
    mask: '#####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  CepWebClient cepWebClient = CepWebClient();

  final TextEditingController bairroController = TextEditingController();

  final TextEditingController enderecoController = TextEditingController();

  final TextEditingController numeroController = TextEditingController();

  final TextEditingController complementoController = TextEditingController();

  final TextEditingController cidadeController = TextEditingController();

  final TextEditingController ufController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  bool isPPageLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bairroController.dispose();
    enderecoController.dispose();
    numeroController.dispose();
    complementoController.dispose();
    cidadeController.dispose();
    ufController.dispose();
    _nomeController.dispose();
    _dataNascimentoController.dispose();
    _celularController.dispose();
    _telefoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isPPageLoading,
      child: Scaffold(
        backgroundColor: PalleteColors.primaryColor,
        appBar: AppBar(
          backgroundColor: PalleteColors.primaryColor,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Cadastro do Motorista",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PalleteColors.accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CustomText(
                    text: "Nome completo do motorista",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: _nomeController,
                    textColor: Colors.white,
                    cursorColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: "Data de nascimento",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: _dataNascimentoController,
                    textColor: Colors.white,
                    cursorColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    keyboadType: TextInputType.number,
                    maskFormatter: [dateInputFormater],
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: "Celular",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFieldWidget(
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskedInputIntel],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // width: 80,
                        child: TextFieldWidget(
                          controller: _celularController,
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskInputNumber],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: "Telefone",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFieldWidget(
                          controller: _telefoneController,
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskedInputIntel],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // width: 80,
                        child: TextFieldWidget(
                          textColor: Colors.white,
                          cursorColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskInputNumber],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "Cep",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 150,
                            child: TextFieldWidget(
                              onChanged: (cep) async {
                                if (cep.length == 10) {
                                  setState(() {
                                    isPPageLoading = true;
                                  });
                                  final resultCep =
                                      await cepWebClient.getCep(cep: cep);
                                  log(resultCep.toJson().toString());

                                  setState(() {
                                    isPPageLoading = false;
                                    bairroController.text = resultCep.bairro;
                                    enderecoController.text =
                                        resultCep.localidade;
                                    complementoController.text =
                                        resultCep.complemento;
                                    cidadeController.text =
                                        resultCep.localidade;
                                    ufController.text = resultCep.uf;
                                  });
                                }
                              },
                              textColor: Colors.white,
                              cursorColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              maskFormatter: [
                                FilteringTextInputFormatter.digitsOnly,
                                CepInputFormatter(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Bairro",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 204,
                              child: TextFieldWidget(
                                controller: bairroController,
                                textColor: Colors.white,
                                cursorColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                keyboadType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Endereço",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 204,
                              child: TextFieldWidget(
                                controller: enderecoController,
                                textColor: Colors.white,
                                cursorColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Número",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 150,
                              child: TextFieldWidget(
                                controller: numeroController,
                                textColor: Colors.white,
                                cursorColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                                maskFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                keyboadType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: "Complemento",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    controller: complementoController,
                    textColor: Colors.white,
                    cursorColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(
                              text: "Cidade",
                              fontSize: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 204,
                              child: TextFieldWidget(
                                controller: cidadeController,
                                textColor: Colors.white,
                                cursorColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            text: "UF",
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 150,
                            child: TextFieldWidget(
                              controller: ufController,
                              textColor: Colors.white,
                              cursorColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(17),
                              ),
                              keyboadType: TextInputType.text,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ButtonCustom(
                        iconRigth: Icons.arrow_forward,
                        backgroundColor: PalleteColors.accentColor,
                        textColor: Colors.white,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        fontWeight: FontWeight.w900,
                        size: const Size(40, 30),
                        height: 40,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => UploadDocumentosMotorista(),
                            ),
                          );
                        },
                        text: "Continuar",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
