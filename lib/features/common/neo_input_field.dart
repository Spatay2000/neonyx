import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:neonyx/features/common/neo_colors.dart';

enum NeoInputType { text, phone }

class NeoInputField extends StatelessWidget {
  final NeoInputType type;
  final TextEditingController controller;
  final String? labelText;
  final String? hint;
  final double? width;
  final bool enableContentPadding;
  final bool readOnly;
  final FocusNode? focusNode;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidateMode;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool? isDense;
  final TextStyle hintStyle;
  final bool isChoosedAddress;
  final bool isNeedBorder;
  final bool isWithSearchIcon;
  final int? maxLines;
  final bool autofocus;
  final Color? fillColor;
  final bool isChatField;

  const NeoInputField(
      {Key? key,
      required this.type,
      required this.controller,
      this.width,
      this.labelText,
      this.hint,
      this.enableContentPadding = true,
      this.readOnly = false,
      this.focusNode,
      this.suffix,
      this.suffixIcon,
      this.onEditingComplete,
      this.textInputAction,
      this.onChanged,
      this.onTap,
      this.isDense,
      this.validator,
      this.autovalidateMode = AutovalidateMode.always,
      this.isChoosedAddress = true,
      this.isNeedBorder = false,
      this.fillColor,
      this.maxLines,
      this.isWithSearchIcon = false,
      this.isChatField = false,
      this.hintStyle = const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: NeoColors.soonColor,
      ),
      this.autofocus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        autocorrect: false,
        autofocus: autofocus,
        readOnly: readOnly,
        focusNode: focusNode,
        keyboardType: keyboardType,
        validator: validator,
        autovalidateMode: autovalidateMode,
        inputFormatters: formatter,
        controller: controller,
        cursorColor: NeoColors.primaryColor,
        textInputAction: textInputAction,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onTap: onTap,
        enableInteractiveSelection: true,
        maxLines: maxLines,
        minLines: 1,
        // ignore: deprecated_member_use
        toolbarOptions: const ToolbarOptions(
          copy: true,
          cut: true,
          paste: true,
          selectAll: true,
        ),
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
          color: NeoColors.white,
        ),
        decoration: InputDecoration(
          constraints: const BoxConstraints(minHeight: 54),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: NeoColors.soonColor,
          ),
          hintText: hint,
          hintStyle: hintStyle,
          prefixIconConstraints: type == NeoInputType.text
              ? null
              : const BoxConstraints(
                  minHeight: 24,
                  minWidth: 24,
                ),
          prefixIcon: type == NeoInputType.text
              ? isWithSearchIcon
                  ? Container(
                      height: 5,
                      width: 5,
                      color: Colors.transparent,
                      child: SvgPicture.asset(
                        'assets/svg/search.svg',
                        height: 4,
                        width: 4,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  : null
              : const Padding(
                  padding: EdgeInsets.only(bottom: 0),
                  child: Text(
                    '+7',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      height: 24 / 16,
                      color: NeoColors.black,
                    ),
                  ),
                ),
          suffix: suffix,
          // suffixIcon: suffix == null ? const SizedBox(height: 34) : null,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(minHeight: 34),
          contentPadding: enableContentPadding
              ? const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12)
              : EdgeInsets.zero,
          border: isNeedBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: NeoColors.soonColor.withOpacity(.4),
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: isNeedBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: NeoColors.soonColor.withOpacity(.4),
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: isNeedBorder
              ? OutlineInputBorder(
                  borderSide: BorderSide(
                    color: NeoColors.soonColor.withOpacity(.4),
                  ),
                  borderRadius: BorderRadius.circular(10),
                )
              : const OutlineInputBorder(borderSide: BorderSide.none),
          errorBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          isDense: isDense,
          fillColor: fillColor,
        ),
      ),
    );
  }

  TextInputType get keyboardType {
    switch (type) {
      case NeoInputType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? get formatter {
    switch (type) {
      case NeoInputType.phone:
        return [MaskTextInputFormatter(mask: "(###) ###-##-##")];
      default:
        return null;
    }
  }
}
