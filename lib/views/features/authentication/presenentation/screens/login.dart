// ignore_for_file: must_be_immutable

import 'package:e_mobi/core/di/di_container.dart';
import 'package:e_mobi/core/navigation/navigation_service.dart';
import 'package:e_mobi/pallete_colors.dart';
import 'package:e_mobi/views/choice_view.dart';
import 'package:e_mobi/views/features/authentication/presenentation/blocs/authentication/authentication_bloc.dart';
import 'package:e_mobi/widgets/text_field/custom_text_field_password_widget.dart';
import 'package:e_mobi/widgets/text_field/custom_text_field_widget.dart';
import 'package:e_mobi/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../../../../widgets/button_custom_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.choice});
  final Choice choice;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController controller = TextEditingController();

  String initialCountry = 'NG';

  PhoneNumber number = PhoneNumber(isoCode: 'BR');

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  bool isPageLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isPageLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          bloc: getIt<AuthenticationBloc>(),
          listener: (context, state) {
            if (state is AuthenticationLoadingState) {
              setState(() {
                isPageLoading = true;
              });
            }
            if (state is AuthenticationValidatorState) {
              isPageLoading = false;
              ToastService().toastAlerta(state.message);
            }
            if (state is AuthenticationSuccessState) {
              setState(() {
                isPageLoading = false;
              });
              print("Login success: ${state.authModel!.toJson().toString()}");
            }
            if (state is AuthenticationError) {
              setState(() {
                isPageLoading = false;
              });
              ToastService().toastErro(state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: 140,
                      height: 140,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: "Email",
                    textEditingController: _emailController,
                  ),
                  CustomTextFieldPassword(
                    hintText: "Palavra-passe",
                    textEditingController: _passwordController,
                    passwordIcons: (Icons.visibility, Icons.visibility_off),
                  ),
                  /*     Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 1,
                        ),
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          print(number.phoneNumber);
                        },
                        onInputValidated: (bool value) {
                          print(value);
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          leadingPadding: 0,
                          showFlags: true,
                          trailingSpace: false,
                          setSelectorButtonAsPrefixIcon: true,
                          useEmoji: true,
                        ),
                        inputDecoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "(11) 98765-4321",
                            hintStyle: TextStyle(fontSize: 12.sp)),
                        ignoreBlank: true,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: number,
                        locale: "pt-BR",
                        searchBoxDecoration: const InputDecoration(
                          hintText: "Selecione o país",
                        ),
                        textFieldController: controller,
                        formatInput: false,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: false,
                          decimal: true,
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                 */
                  const SizedBox(height: 20),
                  ButtonCustom(
                    backgroundColor: PalleteColors.primaryColor,
                    textColor: Colors.white,
                    size: const Size(40, 30),
                    height: 40,
                    onPressed: () {
                      if (widget.choice == Choice.responsavel) {
                        getIt<AuthenticationBloc>().add(
                          LoginEvent(
                            password: _passwordController.text.trim(),
                            username: _emailController.text.trim(),
                            context: context,
                          ),
                        );
                      }
                      if (widget.choice == Choice.motorista) {}
                    },
                    text: "Login",
                  ),
                  const SizedBox(height: 10),
                  ButtonCustom(
                    backgroundColor: PalleteColors.accentColor,
                    textColor: Colors.white,
                    size: const Size(40, 30),
                    height: 40,
                    onPressed: () {
                      NavigationService.push(
                          context: context,
                          page: const ChoiceView(
                            isLoginPage: false,
                          ));
                    },
                    text: "Cadastrar-se",
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1.0,
                            color: PalleteColors.primaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Ou',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1.0,
                            color: PalleteColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonCustom(
                    fontSize: 12,
                    icon: FontAwesomeIcons.facebook,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textColor: Colors.white,
                    text: 'Entrar com o Facebook',
                    backgroundColor: const Color.fromRGBO(59, 89, 149, 1.0),
                    onPressed: () {},
                  ),
                  ButtonCustom(
                    fontSize: 12,
                    icon: FontAwesomeIcons.google,
                    mainAxisAlignment: MainAxisAlignment.center,
                    text: 'Entrar com o Google',
                    textColor: Colors.white,
                    backgroundColor: Colors.blue[600],
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Precisa de ajuda?",
                      style: TextStyle(
                        color: PalleteColors.accentColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
