import 'package:flutter/material.dart';

import '../../res/barrel_file.dart';


class kTextField extends StatelessWidget {
 final String? hintText;
 final String? labelText;
 final String? errorMessage;
  final void Function(String)? onChanged;
final  TextInputType? inputType;
 final String? initialText;
final  double? radius;
final   double? focusedRadius;
const  kTextField(
      {this.inputType,
      this.initialText,
      this.errorMessage,
      this.onChanged,
      this.hintText,
      this.focusedRadius,
      this.radius,
      this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor:primaryColor,
      
      initialValue: initialText,
      keyboardType: inputType,
      // controller: addPostState.unitPriceController,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(focusedRadius ?? 0)),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return errorMessage;
        }
        return null;
      },
    );
  }
}
