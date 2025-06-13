import 'package:e_mobi/pallete_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ConfirmCheckButton extends StatefulWidget {
  final String? description;
  final String? title;
  final bool invertColor;
  final Color? fillColor;
  final Color subtitleColor;
  const ConfirmCheckButton({
    super.key,
    required this.isAccepted,
    required this.onChecked,
    this.invertColor = false,
    this.subtitleColor = PalleteColors.primaryColor,
    this.fillColor = Colors.grey,
    this.title = "Aceito",
    this.description = "os termos e condições",
  });

  final bool isAccepted;
  final void Function(bool? isChecked) onChecked;

  @override
  State<ConfirmCheckButton> createState() => _ConfirmCheckButtonState();
}

class _ConfirmCheckButtonState extends State<ConfirmCheckButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.onChecked(widget.isAccepted);
        });
      },
      child: Row(
        children: [
          Checkbox(
            value: widget.isAccepted,
            onChanged: widget.onChecked,
            fillColor: WidgetStateProperty.all(
                widget.isAccepted ? widget.fillColor : Colors.grey),
            side: const BorderSide(
              color: Colors.grey,
            ),
          ),
          Flexible(
            child: RichText(
              text: TextSpan(
                text: '${widget.title} ',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: widget.invertColor
                        ? Colors.grey
                        : PalleteColors.accentColor,
                    fontSize: 12.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.description,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: widget.invertColor
                          ? widget.subtitleColor
                          : Colors.grey,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
