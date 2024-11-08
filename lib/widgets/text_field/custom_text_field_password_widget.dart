import 'package:e_mobi/widgets/text_field/const/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldPassword extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final int? maxLength;
  final int? maxLine;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final String iconPath;
  final Function(String)? onChange;
  final Color? background;
  final Function(String value)? onGo;
  final Color backgroundTextField;
  final Color? textColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? labelTextColor;

  final (IconData showPassword, IconData hidePassword) passwordIcons;
  const CustomTextFieldPassword({
    this.onChange,
    this.background,
    this.iconPath = "",
    this.maxLine = 1,
    this.onGo,
    required this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
    this.inputFormatters,
    this.maxLength = 80,
    this.backgroundTextField = CustomColorTheme.backgroundTxtField,
    this.textColor,
    super.key,
    this.iconColor,
    this.borderColor,
    required this.passwordIcons,
    this.labelTextColor,
  });

  @override
  Widget build(BuildContext context) {
    bool showPassword = false;
    return StatefulBuilder(builder: (context, state) {
      return TextField(
        maxLength: maxLength,
        maxLines: maxLine,
        controller: textEditingController,
        onChanged: onChange,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        obscureText: !showPassword,
        onSubmitted: onGo,
        decoration: InputDecoration(
          counter: const SizedBox(),
          prefixIcon: _getPrefixIcon(),
          hintText: hintText,
          labelText: background != null ? null : hintText,
          labelStyle: TextStyle(color: labelTextColor ?? Colors.grey),
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(
              showPassword ? passwordIcons.$1 : passwordIcons.$2,
              color: Colors.grey,
            ),
            onPressed: () {
              state(
                () => showPassword = !showPassword,
              );
            },
          ),
          hintStyle: TextStyle(
            color: textColor,
          ),
          fillColor: backgroundTextField,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      );
    });
  }

  Widget? _getPrefixIcon() {
    if (iconPath.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          iconPath,
          height: 2.0,
          width: 2.0,
          fit: BoxFit.fitWidth,
        ),
      );
    }

    if (icon != null) {
      return Icon(
        icon,
        color: iconColor,
      );
    }

    return null;
  }
}
