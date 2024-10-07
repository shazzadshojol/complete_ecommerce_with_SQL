import 'package:flutter/material.dart';

class BottomTextForLoginSignup extends StatelessWidget {
  const BottomTextForLoginSignup({
    super.key,
    required this.text,
    required this.clickableText,
    required this.onTap,
  });

  final String text, clickableText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        TextButton(
          onPressed: onTap,
          child: Text(
            clickableText,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
