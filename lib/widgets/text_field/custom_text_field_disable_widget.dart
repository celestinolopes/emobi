import 'package:e_mobi/widgets/text_field/const/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldDisable extends StatelessWidget {
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
  final Color? labelTextColor;
  final VoidCallback onTap;

  final Color? backgroundTextField;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final Color? iconColor;
  const CustomTextFieldDisable({
    this.onChange,
    this.background,
    required this.onTap,
    this.iconPath = "",
    this.maxLine = 1,
    required this.hintText,
    this.icon,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
    this.inputFormatters,
    this.maxLength = 80,
    this.borderRadius,
    this.borderColor,
    super.key,
    this.backgroundTextField = CustomColorTheme.backgroundTxtField,
    this.textColor,
    this.labelTextColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: TextField(
        enabled: false,
        maxLength: maxLength,
        maxLines: maxLine,
        controller: textEditingController,
        onChanged: onChange,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        style: TextStyle(
          color: textColor,
        ),
        decoration: InputDecoration(
          counter: const SizedBox(),
          prefixIcon: _getPrefixIcon(),
          hintText: hintText,
          labelText: background != null ? null : hintText,
          labelStyle: TextStyle(color: labelTextColor ?? Colors.grey),
          fillColor: backgroundTextField,
          filled: true,
          suffixIcon: const Icon(Icons.keyboard_arrow_down),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor ?? Colors.white,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(8.0),
          ),
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
