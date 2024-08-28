import 'package:flutter/material.dart';
import 'package:stater_project/res/barrel_file.dart';

Widget dropdownWidget({
  required List<String> items,
  required void Function(String?) onChanged,
}) {
  // Check if the items list is not empty
  if (items.isEmpty) {
    throw ArgumentError('The items list must not be empty.');
  }

  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      // Uncomment if you need to add a border around the container
      // border: Border.all(width: 1, color: primaryColor),
    ),
    child: DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(10),
      autofocus: false,
      elevation: 0,
      isExpanded: true,
      isDense: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: primaryColor),
        ),
        fillColor: const Color.fromARGB(
            255, 255, 255, 255), // Set to white or desired color
        filled: true,
      ),
      value: items.first, // Set the initial value to the first item in the list
      onChanged: onChanged,
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: kkTextStyle(),
          ),
        );
      }).toList(),
    ),
  );
}
