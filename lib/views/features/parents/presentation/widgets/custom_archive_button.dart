import 'package:flutter/material.dart';

import '../../../../../pallete_colors.dart';

class CustomArchiveButton extends StatelessWidget {
  const CustomArchiveButton(
      {super.key,
      required this.text,
      required this.assetIcon,
      required this.onClick,
      this.textAlign = TextAlign.start,
      this.space = 0,
      this.centered = false,
      this.showIcon = true,
      this.textColor = Colors.white,
      this.color = PalleteColors.primaryColor});
  final String text;
  final String assetIcon;
  final TextAlign textAlign;
  final VoidCallback onClick;
  final Color color;
  final double space;
  final bool centered;
  final Color textColor;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: centered
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                text.toUpperCase(),
                textAlign: textAlign,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(width: space),
            showIcon
                ? Image.asset(
                    "assets/images/$assetIcon",
                    width: 25,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
