import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../../../pallete_colors.dart';
import '../../../../../widgets/textfield_widget.dart';
import '../../../childrens/presentation/screens/register_child_view.dart';
import '../widgets/custom_archive_button.dart';
import 'upload_documentos.dart';

class CadastroSegundoResponsavel extends StatelessWidget {
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

  CadastroSegundoResponsavel({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Cadastro do 2º Responsável",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: PalleteColors.accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Nome completo do 2º responsável"),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Data de nascimento"),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    keyboadType: TextInputType.number,
                    maskFormatter: [dateInputFormater],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Celular"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFieldWidget(
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskedInputIntel],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // width: 80,
                        child: TextFieldWidget(
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskInputNumber],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("Telefone"),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFieldWidget(
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskedInputIntel],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        // width: 80,
                        child: TextFieldWidget(
                          keyboadType: TextInputType.number,
                          maskFormatter: [celularMaskInputNumber],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
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
                          const Text("Cep"),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 150,
                            child: TextFieldWidget(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
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
                            const Text("Bairro"),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 204,
                              child: TextFieldWidget(
                                keyboadType: TextInputType.text,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Endereço"),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 204,
                            child: TextFieldWidget(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
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
                            const Text("Número"),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 150,
                              child: TextFieldWidget(
                                keyboadType: TextInputType.text,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text("Complemento"),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(17),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cidade"),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 204,
                            child: TextFieldWidget(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
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
                            const Text("UF"),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: 150,
                              child: TextFieldWidget(
                                keyboadType: TextInputType.text,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(17),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Center(child: CustomUploadButton()),
                  const Center(
                    child: Text(
                      "Tire uma foto com o seu documento de identidade",
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomArchiveButton(
                    text: "CPF/RG",
                    assetIcon: "archive.png",
                    onClick: () {},
                  ),
                  const SizedBox(height: 10),
                  CustomArchiveButton(
                    text: "Comprovante de residência",
                    assetIcon: "archive.png",
                    onClick: () {},
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: CustomArchiveButton(
                        text: "Continuar",
                        centered: true,
                        space: 10,
                        assetIcon: "arrow.png",
                        color: PalleteColors.accentColor,
                        textAlign: TextAlign.center,
                        onClick: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (_) => RegistarCrianca(),
                            ),
                          );
                        },
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
