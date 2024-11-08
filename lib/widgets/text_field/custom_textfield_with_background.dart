import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFielWithBackground extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? onChange;
  const CustomTextFielWithBackground({
    required this.hintText,
    required this.icon,
    this.onChange,
    this.textInputType = TextInputType.text,
    required this.textEditingController,
    this.inputFormatters,
    this.maxLength = 80,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 12),
      height: 65,
      padding: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF0FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        maxLength: maxLength,
        controller: textEditingController,
        onChanged: onChange,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          counter: const SizedBox(),
          prefixIcon: Icon(
            icon,
            color: const Color(0XFF6F8099),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff4E4B66),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
