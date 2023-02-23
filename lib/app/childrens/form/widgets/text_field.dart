import 'package:flutter/material.dart';

class PartnerTextField extends StatelessWidget {
  final Function(String value)? onChanged;
  final Function()? onTap;
  final String labelText;
  final String errorText;
  final bool readOnly;
  final TextEditingController? controller;
  const PartnerTextField({
    super.key,
    this.onChanged,
    this.onTap,
    this.controller,
    this.labelText = '',
    this.errorText = '',
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey[800],
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (value == null) {
          return errorText;
        }
        return null;
      },
      onTap: onTap,
      onChanged: onChanged,
    );
  }
}
