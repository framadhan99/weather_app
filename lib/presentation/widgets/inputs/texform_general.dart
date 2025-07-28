import 'package:flutter/material.dart';
import 'package:weather_app/core/utils/utils.dart';

class TextFromGeneral extends StatelessWidget {
  const TextFromGeneral({
    super.key,
    required this.hintText,
    this.obscureText,
    this.hintStyle,
    this.style,
    this.readOnly = false,
    this.border = true,
    this.borderRadius = 8,
    this.borderColor = AssetColors.colorPrimary,
    this.focusBorderColor = AssetColors.colorSecondary,
    this.contentPadding,
    this.controller,
    this.textAlign = TextAlign.start,
    this.prefixIcon,
    this.minLines,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.label = "",
    this.suffixIcon,
    this.validator,
    this.maxLines,
  });

  final String hintText;
  final bool? obscureText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool readOnly;
  final bool border;
  final double borderRadius;
  final Color borderColor;
  final Color focusBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final Widget? prefixIcon;
  final int? minLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? label;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      validator: validator,
      readOnly: readOnly,
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      obscureText: obscureText ?? false,
      style: AssetStyles.description.copyWith(
        color: AssetColors.colorPrimary,
        fontSize: 16,
      ),
      textAlign: textAlign,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: contentPadding,
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: AssetStyles.description.copyWith(
          color: AssetColors.colorPrimary,
          fontSize: 16,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AssetColors.colorPrimary,
        prefixIconConstraints: const BoxConstraints(maxHeight: 20),
        suffixIcon: suffixIcon,
        suffixIconConstraints: const BoxConstraints(maxHeight: 20),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AssetStyles.description.copyWith(
              color: AssetColors.colorSecondary,
              fontSize: 14,
            ),
        enabledBorder: border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: AssetColors.colorSecondary,
                  width: 1,
                ),
              )
            : const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: border
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: focusBorderColor, width: 1),
              )
            : const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
