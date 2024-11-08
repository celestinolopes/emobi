import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomSeachTextField extends StatelessWidget {
  const CustomSeachTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onQrCodeClick,
    this.hideQrCodeButton = false,
    required this.onChanged,
  });

  final TextEditingController? controller;
  final String hintText;
  final VoidCallback onQrCodeClick;
  final void Function(String)? onChanged;
  final bool hideQrCodeButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
          )),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              style: TextStyle(
                fontSize: 13.sp,
                color: const Color(0xffA0A3BD),
              ),
              decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(
                    fontSize: 13.sp,
                    color: const Color(0xffA0A3BD),
                  ),
                  border: InputBorder.none,
                  hintText: hintText),
            ),
          ),
          hideQrCodeButton
              ? const SizedBox()
              : Container(
                  width: 1,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.grey,
                  height: 30,
                ),
          hideQrCodeButton
              ? const SizedBox()
              : InkWell(
                  onTap: onQrCodeClick,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: const Icon(
                    Icons.qr_code_2,
                    color: Color.fromRGBO(0, 122, 255, 1),
                    size: 30,
                  ),
                )
        ],
      ),
    );
  }
}
