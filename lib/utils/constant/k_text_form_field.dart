import 'package:flutter/services.dart';
import 'package:stater_project/res/app_color.dart';

import '../../res/barrel_file.dart';

class KTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool? diabled;
  final String? hint;
  final String? initialValue;
  final String? label;
  final bool required;
  final bool obscureText;
  final TextInputType keyboardType;
  final int maxLines;
  final Color? fillColor;
  final String? errorText;
  final List<TextInputFormatter>? formatters;
  final FocusNode? focusNode;
  final Widget? prefixIcon, suffixIcon;
  final bool takeCheckSpace;
  final void Function(String)? onFieldSubmitted;
  const KTextFormField(
      {this.takeCheckSpace = false,
      this.prefixIcon,
      this.fillColor,
      this.focusNode,
      this.suffixIcon,
      this.validator,
      this.diabled = false,
      this.onChanged,
      this.required = false,
      this.hint,
      this.onFieldSubmitted,
      this.label,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.maxLines = 1,
      this.controller,
      this.initialValue,
      this.errorText,
      this.formatters,
      Key? key})
      : super(key: key);

  @override
  _KTextFormFieldState createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  /// Since custom positioning of default error message was not possible,
  /// this new errorText state variable was created to custom show the validation
  String? errorText;

  /// A checkmark is need to be shown in the TextFormField once the interaction has started
  /// and the validation is error free. This boolean state variable keeps track of whether the interaction has begun or not
  bool interacted = false;

  /// Obscure Text is used for passwords.
  /// This variable needs to be toggled whenever, show/hide state of password is to be toggled.
  late bool obscureText;

  _KTextFormFieldState();

  @override
  void initState() {
    super.initState();
    errorText = widget.errorText;
    if (widget.initialValue != null) {
      setupValues();
    }
    setState(() {
      obscureText = widget.obscureText;
    });
  }

  void setupValues() async {
    await Future.delayed(const Duration(milliseconds: 0));
    widget.onChanged?.call(widget.initialValue!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty)
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        widget.label!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.required == true)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Text(
                            '*',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        )
                    ],
                  )),
              sHeightSpan,
            ],
          ),
        TextFormField(
          inputFormatters: widget.formatters,
          focusNode: widget.focusNode,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: obscureText,
          enabled: !widget.diabled!,
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          onFieldSubmitted: widget.onFieldSubmitted,

          decoration: InputDecoration(
            isCollapsed: true,
            isDense: true,
            fillColor: AppConstants().appTheme
                ? widget.fillColor ?? whiteColor
                : widget.fillColor ?? Colors.grey[800],
            filled: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10.0), // Adjust the padding as per your requirement
            hintText: widget.hint,
            prefixIcon: widget.prefixIcon,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: primaryColor, width: 1)),

            /// For passwords, we need a toggle icon instead of the checkmark,
            /// so we show the toggle buttons as a first priority, then the checkmark.
            suffixIcon: widget.maxLines == 1
                ? widget.obscureText
                    ? Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: darkGrey,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      )
                    : (widget.suffixIcon != null)
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.suffixIcon != null) widget.suffixIcon!,
                              if (widget.suffixIcon != null) mWidthSpan,
                              if ((interacted && errorText == null) ||
                                  widget.takeCheckSpace)
                                Icon(
                                  Icons.check,
                                  color: (interacted && errorText == null)
                                      ? yellowColor
                                      : Colors.transparent,
                                ),
                              if (widget.suffixIcon != null) mWidthSpan,
                            ],
                          )
                        : (interacted && errorText == null)
                            ? const Icon(
                                Icons.check,
                                color: Colors.yellow,
                              )
                            : null
                : null,
            errorStyle: const TextStyle(
              height: 0,
              fontSize: 0,
            ),
            enabledBorder: (interacted && errorText == null)
                ? Theme.of(context).inputDecorationTheme.focusedBorder
                : null,
          ),
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,

          /// Since, default styling for the errorText was not appropriate,
          /// the validator is called manually inside of onChanged and the state variables are updated.
          onChanged: (value) {
            if (widget.validator != null) {
              setState(() {
                errorText = widget.validator!(value);
                interacted = true;
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        if (errorText != null)
          Column(
            children: [
              sHeightSpan,
              Text(
                errorText ?? "",
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: errorColor,
                      // fontSize: AppDimens.headlineFontSizeXXXSmall,
                    ),
              ),
            ],
          )
      ],
    );
  }
}
