import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final double? height;
  final double elevation, borderRadius, fontSize, iconSize, marginLeftIcon;
  final Size size;
  final Color borderColor;
  final Color? backgroundColor, textColor, onPrimary, shadowColor;
  final IconData? icon;
  final IconData? iconRigth;
  final Function? onPressed;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;
  final FontWeight fontWeight;
  final bool isLoading;
  final bool IsEnabled;
  const ButtonCustom({
    super.key,
    this.text = '',
    this.iconRigth,
    this.isLoading = false,
    this.size = const Size(64, 40),
    this.elevation = 1.0,
    this.IsEnabled = true,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.borderRadius = 4.0,
    this.icon,
    this.iconSize = 24.0,
    this.marginLeftIcon = 8.0,
    this.onPrimary,
    this.shadowColor,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.fontWeight = FontWeight.bold,
    this.fontSize = 14.0,
    this.borderColor = Colors.transparent,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !IsEnabled,
      child: SizedBox(
        height: height,
        child: ElevatedButton(
          onPressed: onPressed as void Function()?,
          style: ElevatedButton.styleFrom(
            minimumSize: size,
            padding: padding,
            elevation: elevation,
            backgroundColor: IsEnabled ? backgroundColor : Colors.grey,
            shadowColor: shadowColor,
            shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              side: BorderSide(color: borderColor),
            ),
          ),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              isLoading
                  ? const Row(
                      children: [
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              if (icon != null)
                Row(
                  children: [
                    Icon(
                      icon,
                      color: textColor,
                      size: iconSize,
                    ),
                    if (text.isNotEmpty) SizedBox(width: marginLeftIcon),
                  ],
                ),
              const SizedBox(width: 4),
              Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                ),
              ),
              const SizedBox(width: 2),
              if (iconRigth != null)
                Row(
                  children: [
                    Icon(
                      iconRigth,
                      color: textColor,
                      size: iconSize,
                    ),
                    if (text.isNotEmpty) SizedBox(width: marginLeftIcon),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
