import 'package:flutter/material.dart';

class TextFields extends StatefulWidget {
  const TextFields({
    super.key,
    required this.hintText,
    this.icon,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.keyboard,
  });

  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? keyboard;

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboard,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          prefixIcon: widget.icon,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null),
    );
  }
}
