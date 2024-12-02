import 'dart:developer';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:e_mobi/core/cep/presentation/bloc/cep_bloc.dart';
import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/views/features/drivers/presentation/blocs/motorista/cadastro_motorista_bloc.dart';
import 'package:e_mobi/views/features/drivers/presentation/screeens/upload_documentos_motoristas.dart';
import 'package:e_mobi/views/features/parents/presentation/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toastification/toastification.dart';

import '../../../../../pallete_colors.dart';
import '../../../../../widgets/button_custom_widget.dart';
import '../../../../../widgets/textfield_widget.dart';
import '../../domain/repositories/cadastro_motorista_repository.dart';

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
  final TextEditingController _ddTelefone = TextEditingController();
  final TextEditingController _ddCel = TextEditingController();

  final TextEditingController _cepController = TextEditingController();

  bool isPPageLoading = false;
  bool isEnabled = false;
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
    return BlocConsumer<CadastroMotoristaBloc, CadastroMotoristaState>(
      bloc: getIt<CadastroMotoristaBloc>(),
      listener: (context, state) {
        if (state is CadastroMotoristaLoading) {
          log("carregando ...");
          setState(() {
            isPPageLoading = true;
          });
        }
        if (state is CadastroMotoristaError) {
          toastification.show(
            title: Text(state.message),
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            type: ToastificationType.error,
          );
          log(state.message);
          setState(() {
            isPPageLoading = false;
          });
        }
        if (state is CadastroMotoristaSuccess) {
          toastification.show(
            title: Text(state.message),
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            type: ToastificationType.success,
          );
          setState(() {
            isPPageLoading = false;
          });
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => UploadDocumentosMotorista(),
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocConsumer<CepBloc, CepState>(
          bloc: getIt<CepBloc>(),
          listener: (context, state) {
            if (state is CepInvalidState) {
              toastification.show(
                title: Text(state.errorMessage),
                style: ToastificationStyle.fillColored,
                autoCloseDuration: const Duration(seconds: 3),
                type: ToastificationType.error,
              );
              setState(() {
                isPPageLoading = false;
                bairroController.clear();
                enderecoController.clear();
                complementoController.clear();
                cidadeController.clear();
                ufController.clear();
              });
            }

            if (state is CepLoadingState) {
              setState(() {
                isPPageLoading = true;
              });
            }
            if (state is CepSuccessState) {
              setState(() {
                isPPageLoading = false;
                bairroController.text = state.cepModelo.bairro!;
                enderecoController.text = state.cepModelo.localidade!;
                complementoController.text = state.cepModelo.complemento!;
                cidadeController.text = state.cepModelo.localidade!;
                ufController.text = state.cepModelo.uf!;
              });
            }
          },
          builder: (context, state) {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                                  controller: _ddCel,
                                  textColor: Colors.white,
                                  cursorColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
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
                                    borderSide:
                                        const BorderSide(color: Colors.white),
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
                                  controller: _ddTelefone,
                                  textColor: Colors.white,
                                  cursorColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
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
                                  controller: _telefoneController,
                                  textColor: Colors.white,
                                  cursorColor: Colors.white,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 20),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
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
                                          getIt<CepBloc>()
                                              .add(GetCepEvent(cep: cep));
                                        }
                                      },
                                      textColor: Colors.white,
                                      controller: _cepController,
                                      cursorColor: Colors.white,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 20),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(17),
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 20),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(17),
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 20),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(17),
                                        ),
                                        maskFormatter: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
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
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 20),
                                        border: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(17),
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
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 20),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                fontWeight: FontWeight.w900,
                                size: const Size(40, 30),
                                height: 40,
                                onPressed: () {
                                  getIt<CadastroMotoristaBloc>().add(
                                    CadastrarMotoristaEvent(
                                      params: CadastroMotoristaParams(
                                        nome: _nomeController.text,
                                        email: "test@test.com.br",
                                        ddCelular: _ddCel.text,
                                        ddTelefone: _ddTelefone.text,
                                        dataNascimento:
                                            _dataNascimentoController.text,
                                        celular: _celularController.text,
                                        telefone: _telefoneController.text,
                                        cep: _cepController.text,
                                        bairro: bairroController.text,
                                        endereco: enderecoController.text,
                                        numero: numeroController.text,
                                        complemento: complementoController.text,
                                        cidade: cidadeController.text,
                                        estado: ufController.text,
                                        tipo: "4",
                                      ),
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
          },
        );
      },
    );
  }
}
