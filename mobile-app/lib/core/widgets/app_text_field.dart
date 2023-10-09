import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class AppTextField extends StatelessWidget {
  final String? title, hintText, initialText, labelText;
  final TextInputType? textInputType;
  final Widget? icon, suffixIcon, prefixIcon;
  final bool? obscureText, enabled, autofocus, showCursor, isDense;
  final String? obscureChar, suffixText, errorText;
  final TextEditingController? textEditingController;
  final Function()? onTap;
  final double? fontSize,
      borderWidth,
      focusBorderWidth,
      borderRadius,
      textHeight;
  final int? maxLines, minLines, maxLength, hintMaxLines;
  final EdgeInsets? margin;
  final Iterable<String>? autofillHints;
  final EdgeInsets? padding;
  final Function(String)? onChanged, onSubmitted;
  final FormFieldValidator<String>? validator;
  final Function()? onEditingComplete;
  final TextStyle? errorStyle, labelTextStyle;
  final TextAlign? textAlign;
  final BoxConstraints? suffixBoxConstraints, prefixBoxConstraints, constraints;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final FontWeight? fontWeight;
  final OutlineInputBorder? disabledBorder,
      enabledBorder,
      focusedBorder,
      errorBorder;
  final Color? borderColor,
      focusBorderColor,
      backgroundColor,
      errorBorderColor,
      hintTextColor,
      textColor;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? suffixStyle;
  final TextCapitalization? textCapitalization;
  final Widget? counter;
  final Widget? Function(BuildContext context,
      {required int currentLength,
      required bool isFocused,
      required int? maxLength})? buildCounter;

  const AppTextField(
      {Key? key,
      this.title,
      this.hintText,
      this.textInputType,
      this.icon,
      this.suffixIcon,
      this.obscureText,
      this.obscureChar,
      this.onTap,
      this.fontSize,
      this.maxLines,
      this.minLines,
      this.margin,
      this.padding,
      this.onChanged,
      this.onEditingComplete,
      this.counter,
      this.suffixText,
      this.validator,
      this.initialText,
      this.textEditingController,
      this.enabled,
      this.suffixBoxConstraints,
      this.prefixBoxConstraints,
      this.errorText,
      this.errorStyle,
      this.maxLength,
      this.inputFormatters,
      this.autofocus,
      this.textAlign,
      this.focusNode,
      this.showCursor,
      this.borderWidth,
      this.autofillHints,
      this.prefixIcon,
      this.borderColor,
      this.borderRadius,
      this.backgroundColor,
      this.focusBorderColor,
      this.focusBorderWidth,
      this.textHeight,
      this.errorBorderColor,
      this.textInputAction,
      this.onSubmitted,
      this.disabledBorder,
      this.enabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.labelText,
      this.labelTextStyle,
      this.textAlignVertical,
      this.constraints,
      this.textColor,
      this.fontWeight,
      this.buildCounter,
      this.textCapitalization,
      this.isDense,
      this.hintTextColor,
      this.hintMaxLines,
      this.suffixStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: widget.backgroundColor??Colors.white,
      //   borderRadius: BorderRadius.circular(30),
      //   // borderRadius: BorderRadius.circular(widget.borderRadius??4),
      // ),
      margin: margin,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextFormField(
        autofillHints: autofillHints,
        focusNode: focusNode,
        autofocus: autofocus ?? false,
        maxLength: maxLength,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        validator: validator,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
            fontSize: fontSize ?? 16,
            height: textHeight,
            color: textColor,
            fontFamily: FontFamily.hovesMedium,
            fontWeight: fontWeight),
        initialValue: initialText == null ? null : initialText!,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onTap: onTap,
        showCursor: showCursor ?? true,
        obscureText: obscureText == null ? false : obscureText!,
        obscuringCharacter: obscureChar != null ? obscureChar! : '*',
        keyboardType: textInputType,
        textInputAction: textInputAction,
        onFieldSubmitted: onSubmitted,
        maxLines: maxLines,
        textAlignVertical: textAlignVertical,
        minLines: minLines,
        buildCounter: buildCounter,
        controller: textEditingController,
        enabled: enabled ?? true,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          suffixStyle: suffixStyle ??
              const TextStyle(
                color: AppColors.sdn900,
                fontSize: 16,
              ),
          counter: counter,
          alignLabelWithHint: true,
          labelText: labelText,
          labelStyle: labelTextStyle,
          prefixIcon: prefixIcon,
          errorStyle: errorStyle,
          errorText: errorText,
          isDense: isDense ?? true,
          contentPadding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
          suffixText: suffixText,
          suffixIconConstraints: suffixBoxConstraints,
          suffixIcon: suffixIcon == null ? null : suffixIcon!,
          icon: icon == null
              ? null
              : Container(margin: const EdgeInsets.only(left: 16), child: icon),
          constraints: constraints,
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                    color: focusBorderColor ?? AppColors.primary,
                    width: focusBorderWidth ?? 1),
              ),
          disabledBorder: disabledBorder,
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                    color: borderColor ?? AppColors.borderColor,
                    width: borderWidth ?? 1),
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
                color: borderColor ?? AppColors.borderColor,
                width: borderWidth ?? 1),
          ),
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8),
                borderSide: BorderSide(
                    color: errorBorderColor ?? Colors.red,
                    width: borderWidth ?? 1),
              ),
          filled: true,
          fillColor: backgroundColor ?? Colors.white,
          hintText: hintText,
          hintMaxLines: hintMaxLines,
          hintStyle: TextStyle(
              color: AppColors.grey,
              fontSize: fontSize,
              fontFamily: FontFamily.hovesRegular,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
