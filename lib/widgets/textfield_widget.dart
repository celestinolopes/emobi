import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pallete_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final List<TextInputFormatter>? maskFormatter;
  final TextEditingController? controller;
  final TextInputType keyboadType;
  final TextInputAction? textInputAction;
  final String? labelText, errorText, hintText;
  final TextAlign textAlign;
  final bool enabled, readOnly, obscureText, enableSuggestions, autocorrect;
  final FocusNode? focus;
  final int? maxLength, maxLines;
  final IconData? icon;
  final Function? onPressedIcon, onTap, onEditingComplete;
  final InputBorder? border;
  final TextCapitalization textCapitalization;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String)? onChanged, onSubmitted;
  final Color? borderColor,
      cursorColor,
      fillColor,
      labelColor,
      iconColor,
      textColor;

  const TextFieldWidget({
    super.key,
    this.keyboadType = TextInputType.text,
    this.controller,
    this.obscureText = false,
    this.errorText = '',
    this.maskFormatter,
    this.borderColor = PalleteColors.accentColor,
    this.cursorColor = PalleteColors.accentColor,
    this.labelText,
    this.focus,
    this.maxLength,
    this.maxLines = 1,
    this.border,
    this.fillColor = Colors.transparent,
    this.labelColor = Colors.black,
    this.icon,
    this.onPressedIcon,
    this.iconColor = Colors.black,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.textInputAction,
    this.textColor,
    this.onEditingComplete,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.autofillHints,
    this.enabled = true,
    this.readOnly = false,
    this.contentPadding,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
  });

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextField(
        textAlign: widget.textAlign,
        textCapitalization: widget.textCapitalization,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        onEditingComplete: widget.onEditingComplete as void Function()?,
        onTap: widget.onTap as void Function()?,
        controller: widget.controller,
        focusNode: widget.focus,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        cursorColor: widget.cursorColor,
        obscureText: widget.obscureText && !_isVisiblePassword,
        inputFormatters: widget.maskFormatter ?? [],
        keyboardType: widget.keyboadType,
        autofillHints: widget.autofillHints,
        autocorrect: widget.autocorrect,
        enableSuggestions: widget.enableSuggestions,
        textInputAction: widget.textInputAction,
        style: TextStyle(
          color: widget.textColor,
          fontFamily: 'Montserrat',
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          suffixIcon: widget.icon != null
              ? IconButton(
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.centerRight,
                  icon: Icon(
                    widget.icon,
                    size: 24.0,
                    color: widget.iconColor,
                  ),
                  onPressed: widget.onPressedIcon as void Function()?,
                )
              : widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        _isVisiblePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () => setState(
                        () => _isVisiblePassword = !_isVisiblePassword,
                      ),
                    )
                  : null,
          enabledBorder: widget.border ??
              UnderlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: widget.borderColor!),
              ),
          border: widget.border ??
              UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: widget.borderColor!,
                ),
              ),
          focusedBorder: widget.border ??
              UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: widget.borderColor!,
                ),
              ),
          errorText: widget.errorText!.isNotEmpty ? widget.errorText : null,
          labelText: widget.labelText,
          hintStyle: TextStyle(
            fontSize: 12,
            color: widget.labelColor,
          ),
          labelStyle: TextStyle(
            fontSize: 12,
            color: widget.labelColor,
          ),
        ),
      ),
    );
  }
}
