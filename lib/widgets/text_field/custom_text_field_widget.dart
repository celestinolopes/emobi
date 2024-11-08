import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'const/custom_color.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final int? maxLength;
  final int? maxLine;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final String iconPath;
  final Function(String value)? onChange;
  final Color? background;
  final BorderRadius? borderRadius;
  final Color backgroundTextField;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;

  final Color? labelTextColor;
  const CustomTextField({
    this.onChange,
    this.background,
    this.iconPath = "",
    this.maxLine = 1,
    required this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
    this.inputFormatters,
    this.maxLength = 80,
    super.key,
    this.borderRadius,
    this.backgroundTextField = CustomColorTheme.backgroundTxtField,
    this.textColor,
    this.borderColor,
    this.labelTextColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      maxLines: maxLine,
      controller: textEditingController,
      onChanged: onChange,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: background != null ? null : hintText,
        labelStyle: TextStyle(color: labelTextColor ?? Colors.grey),
        counter: const SizedBox(),
        prefixIcon: _getPrefixIcon(),
        hintText: hintText,
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
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
      ),
    );
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
        color: iconColor ?? const Color(0XFF6F8099),
      );
    }

    return null;
  }
}
